From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Documenting RENAME_WHITEOUT
Date: Wed, 06 May 2015 16:17:03 +0200
Message-ID: <554A225F.1010606@gmail.com>
References: <CAKgNAkiog0S5kHYNb_4+d2ZXcA-nPw-cBsuNG03AyEPt3K34nw@mail.gmail.com> <20150306161145.GA13649@tucsk.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150306161145.GA13649-YynjPCA0bi1olqkO4TVVkw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Miklos,


On 03/06/2015 05:11 PM, Miklos Szeredi wrote:
> On Thu, Jan 29, 2015 at 11:01:08AM +0100, Michael Kerrisk (man-pages)=
 wrote:
>> Hi Miklos,
>>
>> I just noticed that your RENAME_WHITEOUT flag went into Linux 3.18:
>> commit 0d7a855526dd672e114aff2ac22b60fc6f155b08
>> commit 787fb6bc9682ec7c05fb5d9561b57100fbc1cc41
>>
>> Would you be willing to write some text for the rename(2)/renameat2(=
2)
>> man page that described this flag. In that text it would be great to
>> have an explanation of what a whiteout is and why they are useful.
>=20
> Hi Michael,
>=20
> Sorry for the delay...
>=20
>   RENAME_WHITEOUT is a special operation, that only makes sense for
>   overlay/union type filesystem implementations.  Currently it is use=
d
>   internally by the overlay filesystem.
>=20
>   Specifying RENAME_WHITEOUT will create a "whiteout" object at the s=
ource of
>   the rename at the same time as performing the rename.  The whole op=
eration is
>   still atomic, so if the rename succeeds then the whiteout will also=
 have been
>   created.
>=20
>   A "whiteout" is an object that has special meaning in union/overlay=
 type file
>   system constructs, in these constructs multiple layers exists and o=
nly the top
>   one is ever modified.  A whiteout on an upper layer will effectivel=
y hide the
>   matching file on the lower layer, making it appear if the file didn=
't exist.
>=20
>   When a file that exists on the lower layer is renamed, the file is =
first
>   copied up (if not already on the upper layer) and then renamed on t=
he upper,
>   read-write layer.  At the same time the source file needs to be "wh=
iteouted".
>   The whole operation needs to be done atomically.
>=20
>   When not part of a union/overlay the whiteout appears as a char dev=
ice with
>   0,0 device number.  RENAME_WHITEOUT needs the same privileges as cr=
eating a
>   device node (CAP_MKNOD) and will fail with EPERM error if that capa=
bility is
>   missing.
>=20
>   If RENAME_WHITEOUT is specified together wuth RENAME_EXCHANGE, then=
 the rename
>   with fail with EINVAL error.

I did some editing of the text and added some details to come up with t=
he
following. Could you please check it over? I also have one question bel=
ow.
(I have also added some entries under ERRORS, but I've omitted them her=
e.)

       RENAME_WHITEOUT (since Linux 3.18)
              This  operation  makes  sense  only  for overlay/union
              filesystem implementations.

              Specifying RENAME_WHITEOUT creates a "whiteout" object
              at  the  source of the rename at the same time as per=E2=80=
=90
              forming the rename.  The whole operation is atomic, so
              that  if  the  rename  succeeds then the whiteout will
              also have been created.

              A "whiteout" is an object that has special meaning  in
              union/overlay  filesystem  constructs.   In these con=E2=80=
=90
              structs, multiple layers exist and only the top one is
              ever  modified.   A  whiteout  on  an upper layer will
              effectively hide a matching file in the  lower  layer,
              making it appear as if the file didn't exist.

              When a file that exists on the lower layer is renamed,
              the file is first copied up (if  not  already  on  the
              upper layer) and then renamed on the upper, read-write
              layer.  At the same time, the source file needs to  be
              "whiteouted".   The  whole  operation needs to be done

???
After "whitedout", I am tempted to add: "(so that the version of=20
the source file in the lower layer is rendered invisible)".
Is that a correct formulation, and is it helpful to add it?

              atomically.

              When not part of a union/overlay, the whiteout appears
              as a character device with a {0,0} device number.

              RENAME_WHITEOUT requires the same privileges as creat=E2=80=
=90
              ing a device node (i.e., the CAP_MKNOD capability).

              RENAME_WHITEOUT  can't  be  employed   together   with
              RENAME_EXCHANGE.

              RENAME_WHITEOUT  requires  support from the underlying
              filesystem.  Among the filesystems that  provide  that
              support  are  shmem  (since  Linux  3.18), ext4 (since
              Linux 3.18), and XFS (since Linux 4.1).

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
