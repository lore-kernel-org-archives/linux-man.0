From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH] ld.so.8: add some multi-arch notes, linker paths are
 quite varied (but standardized to each arch)
Date: Wed, 01 Apr 2015 09:38:23 +0200
Message-ID: <551BA06F.30303@bfs.de>
References: <1427834937-207547-1-git-send-email-shawn@churchofgit.com> <20150331205227.GA9105@churchofgit.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150331205227.GA9105-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 31.03.2015 22:52, schrieb Shawn Landden:
> I started a multiarch.7 man-page, but I am not sure it belongs in man-pages...
> at least we should not cover all the package manager details.
> 
> .\" Copyright (c) 2015 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> .\"
> .\" %%%LICENSE_START(VERBATIM)
> .\" Permission is granted to make and distribute verbatim copies of this
> .\" manual provided the copyright notice and this permission notice are
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of this
> .\" manual under the conditions for verbatim copying, provided that the
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, this
> .\" manual page may be incorrect or out-of-date.  The author(s) assume no
> .\" responsibility for errors or omissions, or for damages resulting from
> .\" the use of the information contained herein.  The author(s) may not
> .\" have taken the same level of care in the production of this manual,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied by
> .\" the source, must acknowledge the copyright and authors of this work.
> .\" %%%LICENSE_END
> .\"
> .\"
> .TH NPTL 7 2015-03-31 "Linux" "Linux Programmer's Manual"
> .SH NAME
> multiarch \- Multiarch support
> .SH DESCRIPTION
> Multiarch
> is a way of installing multiple binary targets (such as i386-linux-gnu and
> amd64-linux-gnu) on one
> .BR hier (7)
> filesystem, which originated in (but is not limited to)
> Debian and Ubuntu.
> .\"
> .SS Overview and scope
> Multiarch allows binaries of many ABI targets to co-exist on the same system.
> Through the use of
> .BR qemu-user-static (1)
> and
> .BR binfmt.d (5)
> it is even possible to run targets that are not natively runnable. It also can
> be used for cross-compilation.
> .sp
> The current spec does not address having multiple binaries of the same name, and
> thus does not effect
> .BR path_resolution (7)
> .
> .\"
> .SS Library paths
> .IR /lib/${TRIPLET}
> then
> .IR /usr/lib/${TRIPLET}
> then
> .IR /lib/
> then
> .IR /usr/lib/
> .\"
> .SS Include paths
> .IR /lib/include/${TRIPLET}
> then
> .IR /lib/include/
> then
> .IR /usr/lib/include/${TRIPLET}
> then
> .IR /usr/lib/include/
> .\"
> .SS Existing triplets
> The multiarch triplet is a normalized GNU triplet. 
> +               "/usr/lib/x86_64-linux-gnu/", "/lib/x86_64-linux-gnu/",
> +               "/usr/lib/i386-linux-gnu/", "/lib/i386-linux-gnu/",
> +               "/usr/lib/arm-linux-gnueabihf/", "/lib/arm-linux-gnueabihf/",

This is a very long list and will never be complete. You can drop may lines
by writing: "For example:" and explain in a few words what a "normalized GNU triplet"
is.

just my 2 cents,
re,
 wh


> +               "/usr/lib/arm-linux-gnueabi/", "/lib/arm-linux-gnueabi/",
> +               "/usr/lib/aarch64-linux-gnu/", "/lib/aarch64-linux-gnu/",
> +               "/usr/lib/ia64-linux-gnu/", "/lib/ia64-linux-gnu/",
> +               "/usr/lib/mips-linux-gnu/", "/lib/mips-linux-gnu/",
> +               "/usr/lib/mipsel-linux-gnu/", "/lib/mipsel-linux-gnu/",
> +               "/usr/lib/powerpc-linux-gnu/", "/lib/powerpc-linux-gnu/",
> +               "/usr/lib/ppc64-linux-gnu/", "/lib/ppc64-linux-gnu/",
> +               "/usr/lib/s390-linux-gnu/", "/lib/s390-linux-gnu/",
> +               "/usr/lib/s390x-linux-gnu/", "/lib/s390x-linux-gnu/",
> +               "/usr/lib/sh4-linux-gnu/", "/lib/sh4-linux-gnu/",
> +               "/usr/lib/sparc-linux-gnu/", "/lib/sparc-linux-gnu/",
> +               "/usr/lib/sparc64-linux-gnu/", "/lib/sparc64-linux-gnu/",
> +               "/usr/lib/x86_64-linux-gnux32/", "/lib/x86_64-linux-gnux32/",
> .\"
> .SH CONFORMING TO
> https://wiki.ubuntu.com/MultiarchSpec
> https://wiki.ubuntu.com/MultiarchCross
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
