From: Trevor Bramwell <trevor-wfkQdcsGPFLk1uMJSBkQmQ@public.gmane.org>
Subject: PIPE(2) Example Does Not Compile
Date: Thu, 7 Nov 2013 20:32:14 -0800
Message-ID: <CADeGDptxvibs5GBdHszA9cQxxoyAkJw7uN9qSjNGT0PKe_+xgQ@mail.gmail.com>
Reply-To: trevor-wfkQdcsGPFLk1uMJSBkQmQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=047d7b6221eae23e5504eaa2dd70
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--047d7b6221eae23e5504eaa2dd70
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Dear man-page maintainers,

I believe I found a bug in the PIPE(2) example code.

When trying to compile the example code, the following error was thrown:

    pipes.c: In function =91main=92:
    pipes.c:10:5: error: unknown type name =91pid_t=92
         pid_t cpid;
         ^
After adding the line:

    #include <sys/types.h>

The example compiled fine.

I compiled with:

    gcc -Wall -std=3Dc99

Attached is a patch that append the line to include sys/types.h.
---
manpage-version: 3.54-1
gcc-version: gcc (Debian 4.8.2-1) 4.8.2

Let me know if you need any more info, or if this is not truly a bug.

Thank you,
-- Trevor Bramwell

--047d7b6221eae23e5504eaa2dd70
Content-Type: text/x-patch; charset=US-ASCII; name="pipe2.2.patch"
Content-Disposition: attachment; filename="pipe2.2.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hnqxgsxf0

LS0tIHBpcGUyLjIub2xkCTIwMTMtMTEtMDcgMTk6NTc6MTAuMjM0ODM3MTk2IC0wODAwCisrKyBw
aXBlMi4yCTIwMTMtMTEtMDcgMTk6NTc6MTAuMjM0ODM3MTk2IC0wODAwCkBAIC0xMzksNiArMTM5
LDcgQEAKIGFuZCBlY2hvZXMgaXQgb24gc3RhbmRhcmQgb3V0cHV0LgogLm5mCiAKKyNpbmNsdWRl
IDxzeXMvdHlwZXMuaD4KICNpbmNsdWRlIDxzeXMvd2FpdC5oPgogI2luY2x1ZGUgPHN0ZGlvLmg+
CiAjaW5jbHVkZSA8c3RkbGliLmg+Cg==
--047d7b6221eae23e5504eaa2dd70--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
