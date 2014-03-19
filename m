From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: Re: For review: open_by_name_at(2) man page [v2]
Date: Wed, 19 Mar 2014 15:13:49 +1100
Message-ID: <20140319151349.33a76023@notabene.brown>
References: <53271B69.3000305@gmail.com>
	<53284233.3050800@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/xGct.5N=iMEhevDdWDB1mQ+"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53284233.3050800-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andreas Dilger <adilger-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--Sig_/xGct.5N=iMEhevDdWDB1mQ+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Mar 2014 13:55:15 +0100 "Michael Kerrisk (man-pages)"
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi Aneesh, (and others)
>=20
> After integrating review comments from NeilBown and Christoph Hellwig,
> here is draft 2 of a man page I've written for name_to_handle_at(2) and
> open_by_name_at(2). Especially thanks to Neil's comments, several parts
> of the page underwent a substantial rewrite. Would you be willing to=20
> review it please, and let me know of any corrections/improvements?

I didn't notice before but above and in $SUBJ I see "open_by_name_at", which
is fictitious :-)

>=20
> Together, the
> .I pathname
> and
> .I dirfd
> arguments identify the file for which a handle is to obtained.
                                                      ^be


>=20
> The
> .I flags
> argument is a bit mask constructed by ORing together
> zero or more of the following value:
                                     ^s


> .TP
> .B AT_EMPTY_PATH
> Allow
> .I pathname
> to be an empty string.
> See above.
> (which may have been obtained using the
> .BR open (2)
> .B O_PATH
> flag).

What "may have been obtained" ??


> The
> .I flags
> argument
> is as for
> .BR open (2).
> .\" FIXME: Confirm that the following is intended behavior.
> .\"        (It certainly seems to be the behavior, from experimenting.)
> If
> .I handle
> refers to a symbolic link, the caller must specify the
> .B O_PATH
> flag, and the symbolic link is not dereferenced (the
> .B O_NOFOLLOW
> flag, if specified, is ignored).

It certainly sounds like reasonable behaviour.  I cannot comment on intenti=
on
though.
Are you bothered that O_PATH is needed for symlinks?  An fd on a symlink is=
 a
sufficiently unusual thing that it seems reasonable for a programmer to
explicitly say they are expecting one.


>=20
> In the event of an error, both system calls return \-1 and set
> .I errno
> to indicate the cause of the error.
> .SH ERRORS
> .BR name_to_handle_at ()
> and
> .BR open_by_handle_at ()
> can fail for the same errors as
> .BR openat (2).
> In addition, they can fail with the errors noted below.

Should you mention EFAULT if mount_id or handle are not valid pointers?


>=20
> Not all filesystem types support the translation of pathnames to
> file handles.
> .\" FIXME NeilBrown noted:
> .\"    ESTALE is also returned if the filesystem does not support
> .\"    file-handle -> file mappings.
> .\"    On filesystems which don't provide export_operations (/sys /proc
> .\"    ubifs romfs cramfs nfs coda ... several others) name_to_handle_at
> .\"    will produce a generic handle using the 32 bit inode and 32 bit
> .\"    i_generation. open_by_name_at given this (or any) filehandle
> .\"    will fail with ESTALE.
> .\" However, on /proc and /sys, at least, name_to_handle_at() fails with
> .\" EOPNOTSUPP. Are there really filesystems that can deliver ESTALE (the
> .\" same error as for an invalid file handle) in the above circumstances?

This is all wrong - discard it :-)

NeilBrown


--Sig_/xGct.5N=iMEhevDdWDB1mQ+
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUBUykZfTnsnt1WYoG5AQIRuhAAw2bp0C1ui6NEXjbm+3xK9KZGW7GBA4S4
MhbSjTXVzKaGlKz98AHWKJTDx2aS2tXrBwmLBVhqtIXs5V2FUH/0+rHOJwXlnZ/f
48YEZLkCRTzYm4jr1r7ak9hzd4hoGhArzkBXz66yCDQAmldHWCodWC37WSs6qRHy
Co+g3XmeClY6tVlcUEVSOjPaGVa+g/2echaZB4gYm3L/vrL4kH5bGnlnqp/PCXEA
zgBnfTYARPbG8+2RRQm2v38xg3csu10lQVFTlQSc3d22lSwBBOQFhOWOTkb8P5Ic
u2ywU7wB143GItnwBYvl/RICJLrBgbCEk0sRiwgP8fYv1S5iOqgcrRiJxw07q/Vb
u4SjVXYXjFAvYYgSCKZ39I/thgimRRnw53eDsqx3ZDrKBZLi935hBynaabdDdZd7
cH9mQQeEReguN4nxTHQU6uEZls3krxr2UK+5zhnYVo7DgbCbAnWkCTTM2EyqCHe9
JADgQKKfYkVhZoyqtr/PvXe/LTI+/hslpd3pu5zisnMElSct/mfhqAXoTXE6bVz5
Zx7g06K/4y5W+fQ0EYlXrmc3aywdq5k7o8EHK1DC9YExz/4Y6E3tsLPoMNqVZ/FW
ZHhfNo2g8FpAfZxhP0onvr/2A9kMkHeFaqQljMRUvol8X9RUCp3nLwEpdjO0P2hg
yCWfSsGLrTw=
=vxGr
-----END PGP SIGNATURE-----

--Sig_/xGct.5N=iMEhevDdWDB1mQ+--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
