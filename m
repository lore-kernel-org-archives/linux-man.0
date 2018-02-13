From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: mmap.2: clarify alignment of mapping
Date: Tue, 13 Feb 2018 17:47:30 +0100
Message-ID: <646d9eb8-8592-97df-a17c-57cb96445262@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

according to mmap.2 on Linux the mapping will be created at a page
boundary if addr is not NULL.

It remains unclear if this holds true for addr == NULL, too.
I have not checked the coding.

Maybe only the punctuation is wrong:
%s/mapping; on Linux,/mapping. On Linux,/

Best regards

Heinrich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
