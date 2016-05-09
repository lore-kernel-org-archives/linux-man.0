From: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: aarch64 clone() man page omission
Date: Mon, 9 May 2016 22:40:24 +0100
Message-ID: <573103C8.9050008@canonical.com>
References: <571E731A.6050809@canonical.com>
 <20160509213140.GD26300@vapier.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="60RcRfauR6B4HEElOFtvSdDg58B6bxim2"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160509213140.GD26300-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--60RcRfauR6B4HEElOFtvSdDg58B6bxim2
Content-Type: multipart/mixed; boundary="xjpJMjd3QhTN6tnUwMJViKUUpr9VCN9MG"
From: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Message-ID: <573103C8.9050008-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: aarch64 clone() man page omission
References: <571E731A.6050809-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
 <20160509213140.GD26300-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
In-Reply-To: <20160509213140.GD26300-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>

--xjpJMjd3QhTN6tnUwMJViKUUpr9VCN9MG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/05/16 22:31, Mike Frysinger wrote:
> On 25 Apr 2016 20:42, Colin Ian King wrote:
>> currently, the aarch64 clone() system call requires the stack to be
>> aligned at a 16 byte boundary, see arch/arm64/kernel/process.c,
>> copy_thread():
>>
>>                 if (stack_start) {
>>                         if (is_compat_thread(task_thread_info(p)))
>>                                 childregs->compat_sp =3D stack_start;
>>                         /* 16-byte aligned stack mandatory on AArch64 =
*/
>>                         else if (stack_start & 15)
>>                                 return -EINVAL;
>>                         else
>>                                 childregs->sp =3D stack_start;
>>                 }
>>
>>
>> ..and returns -EINVAL if not aligned correctly.  This should be added =
to
>> the manual page clone(2) as it took me a while to figure out why clone=
()
>> was failing with -EINVAL for aarch64 but not on x86.
>=20
> seems weird for the kernel to be enforcing this.  is it just because of=

> the stated ABI ?  or is there some weird requirement in the kernel itse=
lf
> that requires this ?  it's not like other arches have this check, and
> there are def ABI requirements about stack alignments in C.
> -mike
>=20
The article here indicates it is an aarch64 convention:

https://community.arm.com/groups/processors/blog/2015/11/19/using-the-sta=
ck-in-aarch32-and-aarch64





--xjpJMjd3QhTN6tnUwMJViKUUpr9VCN9MG--

--60RcRfauR6B4HEElOFtvSdDg58B6bxim2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXMQPJAAoJEGjCh9/GqAIm42UQAJxiTa0nml9QbSFd9vdWnnxd
Enpl3GTGAHjuo8gPh2qJbf9ByRSOVNQBBUKcQBkMN/uRWU5AuFDVq/tb38nXTtni
X70ecfj9ZOBI1joMz3WEc07MGFFIE+UbmQrZFk0mkf7Pz9gIWV+d7gVxd4ovwQLt
9GhzEKWyuFvomQjgXwGZfZ50e7f/lBuazgH9CfopIabsrzDxbGFcKEJefKXvqu8G
2ITIn0yeQ/Z+ApS7LZL2qe6hZPa5sEgODQgLuPLzhenfGOgaLSSRfiDt8uYq7jQf
h3Lvwg0etuxQPDBErPJv2Ca+MF7oQBC9l/iPV8qLUuNhc9GAIQSrIRSMT+voyy6d
qk5RYFkFX8EfdG5yJgxgzxtfjHBTFdRyr2l8uwuYMQz1yGB235ITGzkifKoB10ej
exRqmNwGZ/2w36qgpOuMBj2Gg9OLi2QgF//gNI6vZvFD77YFDuJuQ24vvMcVdIF8
lgNwGYOLN69wlURFCdKF5VNzYQDfhyTnahRRRVZ6dOtx2s8cFsTe3X4oKVrSSch3
7gV7Ed36pYVIG3+ZtOMzZZebOPcZkiey0DJvU8wMI9x9ZPwJY0jfNTKWPR2npkAM
AuPC8Qa7W0OiuEew/MzmvphXxMNxTnzs1sKG3QkoClBX1jckNNB4DjxAC1Xy6oFH
NX4IDBk7Yln3tONjg0Q2
=7FUu
-----END PGP SIGNATURE-----

--60RcRfauR6B4HEElOFtvSdDg58B6bxim2--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
