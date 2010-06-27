From: Davidlohr Bueso <dave.bueso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Doubts with sysfs(2)
Date: Sun, 27 Jun 2010 06:51:12 -0400
Message-ID: <1277635872.25713.4.camel@cowboy>
Reply-To: dave.bueso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tdyas-plZrL8KR64B+CIkdHa1UOg@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

I recently ran into the sysfs(2) call and noticed that the manpage does
not specify what header file(s) to include to use it. Now, is this
because of the lack of libc/glibc support (hence no wrapper available)?

If so, I think we should add this problem in the BUGS section of the
page, and put something like:

syscall(SYS_sysfs, number);

Any comments would be appreciated.

Thanks,
Davidlohr

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
