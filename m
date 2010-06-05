From: Paul A Sand <pas-JNhspZqLHXk@public.gmane.org>
Subject: Bug in crypt(3) man page
Date: Sat, 5 Jun 2010 07:44:05 -0400
Message-ID: <20100605114404.GA30106@cisunix.unh.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk-manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi --

I have version 3.23 of man-pages (Fedora 13). At the very
end of 'Glibc Notes' of crypt(3):

    In the SHA implementation the entire key is significant
    (instead of only the first 8 bytes in MD5).

I'm pretty sure that's incorrect. I think both MD5 and SHA implementations
use the whole key, and the 8-byte significance restriction is
applies to (just) the original DES. 

I also have version 2.39 of man-pages on Red Hat 5; I think it's more
accurate there.

The problem is also present on the online man page:

    http://www.kernel.org/doc/man-pages/online/pages/man3/crypt.3.html

The man page also may be incorrect with the max salt lengths.
I think this is eight bytes for MD5, 16 for SHA-256 and SHA-512.
(The page implies 16 for MD5 too.)

Thanks much for your work on the man pages.




-- 
-- Paul A. Sand                 | Necessity is the plea for every infringement
-- University of New Hampshire  | of human freedom. It is the argument of
-- pas-JNhspZqLHXk@public.gmane.org                  | tyrants; it is the creed of slaves.
-- http://pubpages.unh.edu/~pas |     (William Pitt, 1783)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
