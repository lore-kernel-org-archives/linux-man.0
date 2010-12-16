From: "Taylan Ulrich B." <taylanbayirli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ed(1p) typo/mistake
Date: Thu, 16 Dec 2010 18:25:53 +0100
Message-ID: <AANLkTim11cTLhGfUQ+FoS=-124H+fKmWNi6Mt159FRb5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In upstream man-pages-posix-2003-a/man1p/ed.1p, line 282 misses a
comma before the first "addr".

The official documentation has it right (see the table at the bottom
of the section "Addresses in ed"):
http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ed.html

In other words...
printf '%s\n' '282s/^/, /' wq | ed man-pages-posix-2003-a/man1p/ed.1p
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
