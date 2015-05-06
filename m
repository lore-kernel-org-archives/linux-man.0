From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Documenting RENAME_WHITEOUT
Date: Wed, 06 May 2015 17:46:36 +0200
Message-ID: <554A375C.2050506@gmail.com>
References: <CAKgNAkiog0S5kHYNb_4+d2ZXcA-nPw-cBsuNG03AyEPt3K34nw@mail.gmail.com>	<20150306161145.GA13649@tucsk.suse.de>	<554A225F.1010606@gmail.com> <CAJfpegv1evXH=iYXd1tvcYzu7OWp753TbLBFnesm8joZQEtZyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <CAJfpegv1evXH=iYXd1tvcYzu7OWp753TbLBFnesm8joZQEtZyg@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: mtk.manpages@gmail.com, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hello Miklos,

On 05/06/2015 04:49 PM, Miklos Szeredi wrote:
> Hi Michael,
>=20
> On Wed, May 6, 2015 at 4:17 PM, Michael Kerrisk (man-pages)
> <mtk.manpages@gmail.com> wrote:
>> I did some editing of the text and added some details to come up wit=
h the
>> following. Could you please check it over? I also have one question =
below.
>> (I have also added some entries under ERRORS, but I've omitted them =
here.)
>>
>>        RENAME_WHITEOUT (since Linux 3.18)
>>               This  operation  makes  sense  only  for overlay/union
>>               filesystem implementations.
>>
>>               Specifying RENAME_WHITEOUT creates a "whiteout" object
>>               at  the  source of the rename at the same time as per=E2=
=80=90
>>               forming the rename.  The whole operation is atomic, so
>>               that  if  the  rename  succeeds then the whiteout will
>>               also have been created.
>>
>>               A "whiteout" is an object that has special meaning  in
>>               union/overlay  filesystem  constructs.   In these con=E2=
=80=90
>>               structs, multiple layers exist and only the top one is
>>               ever  modified.   A  whiteout  on  an upper layer will
>>               effectively hide a matching file in the  lower  layer,
>>               making it appear as if the file didn't exist.
>>
>>               When a file that exists on the lower layer is renamed,
>>               the file is first copied up (if  not  already  on  the
>>               upper layer) and then renamed on the upper, read-write
>>               layer.  At the same time, the source file needs to  be
>>               "whiteouted".   The  whole  operation needs to be done
>>
>> ???
>> After "whitedout", I am tempted to add: "(so that the version of
>> the source file in the lower layer is rendered invisible)".
>> Is that a correct formulation, and is it helpful to add it?
>=20
> Yes, that's correct, and helpful, I think.

Added. Thanks for confirming, and thanks of course for your original te=
xt!

Cheers,

Michael

>>               atomically.
>>
>>               When not part of a union/overlay, the whiteout appears
>>               as a character device with a {0,0} device number.
>>
>>               RENAME_WHITEOUT requires the same privileges as creat=E2=
=80=90
>>               ing a device node (i.e., the CAP_MKNOD capability).
>>
>>               RENAME_WHITEOUT  can't  be  employed   together   with
>>               RENAME_EXCHANGE.
>>
>>               RENAME_WHITEOUT  requires  support from the underlying
>>               filesystem.  Among the filesystems that  provide  that
>>               support  are  shmem  (since  Linux  3.18), ext4 (since
>>               Linux 3.18), and XFS (since Linux 4.1).
>=20
> Looks good to me.
>=20
> Thanks,
> Miklos
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
