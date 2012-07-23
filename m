From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Re: =?UTF-8?Q?st=5Fsize?= of a symlink
Date: Mon, 23 Jul 2012 17:53:45 -0400
Message-ID: <cone.1343080425.420260.24471.1000@monster.email-scan.com>
References: <500D73FF.1070504@nod.at> <alpine.LNX.2.00.1207231959410.1922@swampdragon.chaosbits.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_monster.email-scan.com-24471-1343080425-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jesper Juhl <jj-IYz4IdjRLj0sV2N9l4h3zg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_monster.email-scan.com-24471-1343080425-0001
Content-Type: text/plain; format=flowed; delsp=yes; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Jesper Juhl writes:

> Let's see what procfs reports:
>   [root@arch ~]# ls -l /proc/$$/exe
>   lrwxrwxrwx 1 root root 0 Jul 23 19:58 /proc/884/exe -> /bin/bash
> Doesn't seem quite right....

That's because it looks like a symlink, it feels like a symlink, but it's  
not really a symlink.

> So, from my point of view it looks like procfs is the one who has got it
> wrong.
> We should probably fix that (IMVHO).

If you remove a running process's executable, that "symlink" will now read  
"$filename (deleted)".

Surprisingly, you will be able to open(2) this alleged "symlink".



--=_monster.email-scan.com-24471-1343080425-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlANx+kACgkQx9p3GYHlUOKH8gCfU5FJueGwYaPI6DrC+kT2qpRn
pPoAnjjB2+6XACs4+Jt3BPCjbm8ZAtKn
=Fohy
-----END PGP SIGNATURE-----

--=_monster.email-scan.com-24471-1343080425-0001--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
