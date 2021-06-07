From: "#FROM_NAME" <#FROM_MAIL>
To: "#TO_NAME" <#TO_MAIL>
Subject: Convert
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MULTIPART-MIXED-BOUNDARY"

--MULTIPART-MIXED-BOUNDARY
Content-Type: multipart/alternative; boundary="MULTIPART-ALTERNATE-BOUNDARY"

--MULTIPART-ALTERNATE-BOUNDARY
Content-Type: text/plain; charset="UTF-8"

Hello #TO_NAME

--MULTIPART-ALTERNATE-BOUNDARY
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
<div dir=3D"ltr">Hello #TO_NAME</div>

--MULTIPART-ALTERNATE-BOUNDARY--
--MULTIPART-MIXED-BOUNDARY
Content-Type: application/octet-stream; name="#ATTACHMENT_NAME"
Content-Disposition: attachment; filename="#ATTACHMENT_NAME"
Content-Transfer-Encoding: base64
