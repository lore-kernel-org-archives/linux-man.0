From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Tue, 24 Apr 2012 13:49:29 -0400
Message-ID: <201204241349.31377.vapier@gentoo.org>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org> <CAKgNAki+hiCAdGe9ExFsY2MwsLE=yvHib+nb5WQbXqtBXCqHMw@mail.gmail.com> <CAKgNAkg2ag9cR217km4vLM0kZYANfayNt=4mvfiObnL4LY3ztQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2617774.UZYKVqkzF6";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkg2ag9cR217km4vLM0kZYANfayNt=4mvfiObnL4LY3ztQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart2617774.UZYKVqkzF6
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 24 April 2012 05:11:54 Michael Kerrisk (man-pages) wrote:
> The
> .BR process_vm_readv ()
> system call transfers data from the remote process to the local process.
> The data to be transferred is identified by
> .IR remote_iov
> and
> .IR riovcnt :
> .IR remote_iov
> is a pointer to an array describing address ranges in the process
> .IR pid ,

maybe add the word "remote" here:
	... in the remote process pid, ...

> The data is transferred to the locations specified by
> .IR local_iov
> and
> .IR liovcnt :
> .IR local_iov
> is a pointer to an array describing address ranges in the calling process,

calling -> local

> The
> .BR process_vm_writev ()
> system call is the converse of
> .BR process_vm_readv ()\(emit

this renders as:
	... process_vm_readv()=E2=80=94it transfers ...

were you going to kill off that weird dash, or just add spacing around it ?

> Other than the direction of the transfer, the arguments
> .IR liovcnt ,
> .IR local_iov ,
> .IR liovcnt ,
> and
> .IR remote_iov
> have the same meaning as for
> .BR process_vm_readv ().

that second liovcnt is supposed to be riovcnt

> Note, however, that these system calls do not check the memory regions
> in the remote process until just before doing the read/write.
> Consequently, a partial read/write (see RETURN VALUE)

should that RETURN VALUE be bolded ?

> may result if one of the
> .I remote_iov
> elements points to an invalid memory region in the remote process.
> No further reads/writes will be attempted beyond that point.
> Keep this in mind when attempting to read data of unknown length
> (such as C strings that are null-terminated) from a remote process,
> by avoiding spanning memory pages (typically 4KiB) in a single remote
> .I iovec
> element.
> (Instead, split the remote read into two
> .I remove_iov
> elements and have them merge back into a single write array entry.

maybe change "array" to "local_iov"
=2Dmike

--nextPart2617774.UZYKVqkzF6
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPluerAAoJEEFjO5/oN/WBx1IQAL/gZDTyDicnI/WYwTB2RocV
5JBBq8FOcM1lJEH9c5Ab+eNa3YXP2Njh38qG7OownztVdaeYYtUzfbesUBSy4uhH
bH66n1oNNRAJpINiBmWYw65UJWm1ZFf32ihdwEOYxjWPZJzdWZKQrtJRuymeFMSf
TVS/2Co10zJV8+pVZvc+5E0hIx1J4By2rWGPb7v+4K3sZExNHgqOZtGaQEcF5vs5
BRfnT4hZBlPPXm0L5FZWiT+c3zYBrTWamoNN+5Y6VT3gYacP0Zhwi9dj9bVuE1+j
c0eDiMSyF2xnc81xGRD/Rklma0PPBlZJcHA65R5ioSP/GrbIlc/FWtoNnavHmVsP
Yqa17j46Xtj5f30WXSh5kTxG9aqEIM9tgPQMY5ptO0/Y//C7PtoNTUIZ4y9rAGmQ
V2mnkOs0EEuSaboJwPuBw9Oy3boVYoEvg7/8wI8WMNxhZBgB7yGg5jStKU1YfcsX
eIb0Gzl/dEPmdGL8XW68NtusWM7IDMJrEiNfAfLBF4sXf2nHK0liRyH0IsJ28kJf
XRyVVJlq0PpUQrKq8srPhLA8CK3Gp4CnRebBnfYuqRye0L5e6dcgQChj5ecRQLYO
+phFMeS/vIJJ0/r4FiDk1wjkA3EP0vc1cG1mkgvlWMH19o1ZtkU6U9/5BgLFY0Nt
SUxCyaukFS/WA3l84xNG
=GN/m
-----END PGP SIGNATURE-----

--nextPart2617774.UZYKVqkzF6--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
