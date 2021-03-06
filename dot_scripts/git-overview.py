#!/usr/bin/env python3
"""
Origin : https://github.com/qznc/dot/blob/master/bin/git-overview
Gather a general overview from a git repository.
It shall identify the major contributors within a project.
It shall identify interesting parts in the code.
"""

from subprocess import check_output
from datetime import datetime
from os.path import splitext

_CMD_AUTHOR_HISTORY = 'git log --date=iso --format="format:%an;%ad;%G?;%H"'
_CMD_FILELIST = "git ls-files"
_CMD_COMMIT_FILES_CHANGES = "git diff-tree --no-commit-id --name-only -r "

from collections import namedtuple

FileInfo = namedtuple("FileInfo", "path,authors,commits,firstc,lastc")


def read_log_data():
    total_commits = 0
    authors = dict()
    files = dict()
    raw = check_output(_CMD_AUTHOR_HISTORY, shell=True, universal_newlines=True)
    for line in raw.split("\n"):
        total_commits += 1
        name, dt, signed, hash = line.split(";")
        if not name in authors:
            authors[name] = (datetime.now(), datetime(1900, 1, 1), 0)
        first, last, count = authors[name]
        when = datetime.strptime(dt[:-6], "%Y-%m-%d %H:%M:%S")
        if when < first:
            first = when
        if when > last:
            last = when
        authors[name] = (first, last, count + 1)
        craw = check_output(
            _CMD_COMMIT_FILES_CHANGES + hash, shell=True, universal_newlines=True
        )
        for file in craw.split("\n"):
            if file == "":
                continue
            if file in files:
                fi = files[file]
            else:
                files[file] = fi = dict(
                    path=file,
                    authors=set(),
                    commits=0,
                    firstc=datetime.now(),
                    lastc=datetime(1900, 1, 1),
                )
            fi["authors"].add(name)
            fi["commits"] += 1
            if when < fi["firstc"]:
                fi["firstc"] = when
            if when > fi["lastc"]:
                fi["lastc"] = when
    return authors, files, total_commits


def readable_duration(dur):
    """Given a timedelta object, returns a human-readable string"""
    if dur.days > 0:
        if dur.days > 365 * 2:
            return "%d years" % (dur.days / 365)
        elif dur.days > 30 * 5:
            return "%d months" % (dur.days / 30)
        else:
            return "%d days" % (dur.days)
    else:
        if dur.seconds > 60 * 60 * 2:
            return "%d hours" % (dur.seconds / 60 / 60)
        elif dur.seconds > 60 * 5:
            return "%d minutes" % (dur.seconds / 60)
        else:
            return "%d seconds" % (dur.seconds)


def partition_by_extension(fileinfo):
    pd = dict()
    meta = dict()
    total_filecount = 0
    total_extfilecount = 0
    for path, fi in fileinfo.items():
        total_filecount += 1
        root, ext = splitext(path)
        if not ext:
            continue
        total_extfilecount += 1
        if not ext in pd:
            pd[ext] = dict()
            meta[ext] = dict(filecount=0)
        pd[ext][path] = fi
        meta[ext]["filecount"] += 1
    return pd, meta, total_filecount, total_extfilecount


def print_top_committers(authorinfo, total_commits):
    authors = sorted(authorinfo.items(), key=lambda x: x[1][2], reverse=True)
    total_authors = len(authors)
    committed = 0
    print("Top Committers (of %d authors):" % (total_authors))
    for author, info in authors:
        first, last, count = info
        readable_last = last.strftime("%Y-%m-%d")
        if count == 1:
            print("%-20s    1 commit on %s" % (author, readable_last))
        else:
            duration = readable_duration(last - first)
            print(
                "%-20s %4d commits during %s until %s"
                % (author, count, duration, readable_last)
            )
        committed += count
        if committed > total_commits * 0.8:
            break
    print(
        " together these authors have 80+%% of the commits (%d/%d)"
        % (committed, total_commits)
    )


def print_important_files(fileinfo):
    files = list(fileinfo.values())
    files.sort(key=lambda x: x["commits"])
    print("Files with most commits:")
    for x in files[-5:]:
        readable_last = x["lastc"].strftime("%Y-%m-%d")
        duration = readable_duration(x["lastc"] - x["firstc"])
        print(
            "%4d commits: %-20s during %s until %s"
            % (x["commits"], x["path"], duration, readable_last)
        )
    print()
    files.sort(key=lambda x: len(x["authors"]))
    print("Files with most authors:")
    for x in files[-5:]:
        print("%2d authors: %-20s" % (len(x["authors"]), x["path"]))


def print_extension_info(fileinfo):
    pfileinfo, extinfo, total_filecount, total_extfilecount = partition_by_extension(
        fileinfo
    )
    pf = [(e, i) for e, i in pfileinfo.items()]
    pf.sort(key=lambda x: extinfo[x[0]]["filecount"], reverse=True)
    print("By file extension:")
    fc = 0
    for ext, info in pf:
        c = extinfo[ext]["filecount"]
        print("%5s: %d files" % (ext, extinfo[ext]["filecount"]))
        fc += c
        if fc > total_filecount * 0.8:
            break
    print(" together these make up 80+%% of the files (%d/%d)" % (fc, total_filecount))


authorinfo, fileinfo, total_commits = read_log_data()
print_top_committers(authorinfo, total_commits)
print()
print_important_files(fileinfo)
print()
print_extension_info(fileinfo)
