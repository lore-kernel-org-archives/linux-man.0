From: Felipe Pena <felipensp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: elf.5: Typo on macro name
Date: Tue, 18 Dec 2012 20:26:27 -0200
Message-ID: <CA+5g0S+mZXXiyF=_iiywZLHqH04g=KaTaiKo6Lqac31gNrkxtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi all,
I just noticed a typo in the ELF[32|64]_R_TYPE macro name in the
current ELF(5) man page. The patch follows below:


diff --git a/man5/elf.5 b/man5/elf.5
index 5ead1bb..8b63c2e 100644
 --- a/man5/elf.5
+++ b/man5/elf.5
@@ -1756,7 +1756,7 @@ types are processor specific.
 When the text refers to a relocation
 entry's relocation type or symbol table index, it means the result of
 applying
 -.BR ELF_[32|64]_R_TYPE
+.BR ELF[32|64]_R_TYPE
 or
 .BR ELF[32|64]_R_SYM ,
 respectively, to the entry's



Thanks!

-- 
Regards,
Felipe Pena
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
