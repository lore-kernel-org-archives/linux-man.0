From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Re: Cannot bind an AF_UNIX socket with large filenames
Date: Sat, 29 Nov 2008 11:54:25 -0500
Message-ID: <cone.1227977665.259611.8091.500@commodore.email-scan.com>
References: <cone.1227969283.265765.5728.500@commodore.email-scan.com> <cfd18e0f0811290821i12790c61v8bdf8de4814522e4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_mimegpg-commodore.email-scan.com-8091-1227977665-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-commodore.email-scan.com-8091-1227977665-0001
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Michael Kerrisk writes:

> Hi Sam,
> 
> (Always worth CCing me as well as the list, if you want my attention
> on a bug report.)
> On Sat, Nov 29, 2008 at 9:34 AM, Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org> wrote:
>> It looks like the kernel -- at least 2.6.27.5 -- rejects with EINVAL a
>> bind() of an AF_UNIX socket whose given size exceeds sizeof(struct
>> sockaddr_un).
>>
>> Even if I make arrangements for a larger structure to accomodate a path that
>> exceeds sockaddr_un's 107 bytes + \0, and I specify the actual size of the
>> structure, bind() fails for me.
>>
>> I don't have the details, but I'm pretty sure other unixes accept domain
>> sockets with larger filenames.
> 
> Are you sure of that?  Offhand, I don't know of such implementations,
> but it's been a while since I tested this.  Which systems have you
> seen this on?

Well, by process of elimination it has to be either Solaris or AIX, since 
those are the only ones I've worked with, in the last couple of decades. 
However, I don't remember which specific versions.

>> There, the sockaddr_un structure exists for
>> historical reasons, and you can pretty much roll your own.
>>
>> This is perhaps worth mentioning in the description of EINVAL in unix(7).
> 
> I'm not (yet) convinced.

Well, various pathnames on various distros are getting longer, as times go 
by. That's how this one came up on my radar screen.

It might be interesting to track down where the magical 108 byte limitation 
came from, but I don't really know where to look. Presuming four bytes for 
the address family, that leaves the total structure of 112 bytes. Can't 
think of a reason to use precisely that size, nothing more, and nothing 
less.

--=_mimegpg-commodore.email-scan.com-8091-1227977665-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkkxc8EACgkQx9p3GYHlUOIRegCfb2L2x59oUQ2H4nzChP5hlNR4
DGgAn3fRJiUNRBL4u9nXxc1lgUwOZQUy
=iU5b
-----END PGP SIGNATURE-----

--=_mimegpg-commodore.email-scan.com-8091-1227977665-0001--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
