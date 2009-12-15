From: Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
Subject: Re: fcntl for mingw
Date: Mon, 14 Dec 2009 22:16:26 -0700
Message-ID: <4B271BAA.2060802@byu.net>
References: <loom.20091211T001536-796@post.gmane.org> <200912111638.17976.bruno@clisp.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200912111638.17976.bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bruno Haible <bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>
Cc: bug-gnulib-mXXj517/zsQ@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

According to Bruno Haible on 12/11/2009 8:38 AM:
>> +  switch (action)
>> +    {
>> +    case F_DUPFD_CLOEXEC:
>> +      {
>> +        int target = va_arg (arg, int);
> 
> Is the arg of type 'int' or 'long'? POSIX says it's an 'int'. But
> the Linux man page
>   <http://www.kernel.org/doc/man-pages/online/pages/man2/fcntl.2.html>
> says it's 'long' "in most cases", and indeed glibc's fcntl.c implementation
> uses a 'void *', that is, the same as a 'long'.

That's (hopefully) a bug in the Linux man page.  The return type is int,
and since the arg is an fd and the return type an fd, they had better be
the same type.  But all the same, I'm cc'ing the man page maintainer.

> 
> It makes a difference on big-endian 64-bit platforms (SPARC64, PPC64),

No one writes fcntl(fd,F_DUPFD,1L), since that is contrary to POSIX; and
if fcntl(fd,F_DUPFD,1) doesn't work, then that is a bug in the kernel.

- --
Don't work too hard, make some time for fun as well!

Eric Blake             ebb9-PGZyUNKar/Q@public.gmane.org
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (Cygwin)
Comment: Public key at home.comcast.net/~ericblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAksnG6oACgkQ84KuGfSFAYB5XwCbBQlPvrRFn/z1/NXXYl6gf52Y
KukAn2DGKBcBEkojl7R3gZZ7uLB0kNao
=AEwR
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
