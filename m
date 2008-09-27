From: "=?UTF-8?Q?Ricardo_Catalinas_Jim=C3=A9nez?=" <jimenezrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Small improvement in man page readdir(3)
Date: Sat, 27 Sep 2008 16:04:40 +0200
Message-ID: <28ecc63c0809270704v627aeaa1v906718ddbb33cca5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In NOTES section says Linux use the d_type field of the struct dirent
which is only true with certain filesystem like ext2 and ext3. With
XFS and reiserfs d_type is always equal to 0.
I think would be a good idea to add just a small comment like "Under
certain filesystem like ext2 and ext3..." to avoid confussion.

Also there is a small typo in the SYNOPSIS section where there is an
extra line break between the two includes:
#include <sys/types.h>
     //extra line break here
#include <dirent.h>

I have the readdir(3) from 2007-07-30 which comes with the ubuntu 8.04
in the manpages-dev package version 2.77-1.

Thanks in advance for your attention.
-- 
Ricardo
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
