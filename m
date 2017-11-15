From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] smartpqi: initial submit of smartpqi man page
Date: Wed, 15 Nov 2017 13:00:00 +0100
Message-ID: <CAKgNAkgjsOA2CO5VUF-bYjuyBgr2aiBMZT2V0nvHwzm1sker8Q@mail.gmail.com>
References: <150833943926.13185.7883447908516236321.stgit@brunhilda>
 <20171019213558.aelneujzgyucrye3@crack.deadbeast.net> <4993A297653ECB4581FA5C3C31323D196721BE80@avsrvexchmbx2.microsemi.net>
 <588a2c6e-f01c-f1e8-9fd0-cdcd414dc973@gmail.com> <20171101013656.urhyeq7h2ccclxzu@crack.deadbeast.net>
 <4993A297653ECB4581FA5C3C31323D19698EAC78@avsrvexchmbx1.microsemi.net>
 <CAKgNAkiPn1aiBBwDOdds-WBbQY+NAfnh6QXhp9hBTU_3hhOBKQ@mail.gmail.com> <4993A297653ECB4581FA5C3C31323D19698FB27C@avsrvexchmbx2.microsemi.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4993A297653ECB4581FA5C3C31323D19698FB27C-d/0VHx0KLVy29+vl7/RAAEujk09f5ZhB0e7PPNI6Mm0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
Cc: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gerry Morong <gerry.morong-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, John Hall <John.Hall-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Bader Ali - Saleh <bader.alisaleh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Teel <scott.teel-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Justin Lindley <justin.lindley-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Benesh <scott.benesh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Don,

>> .\" FIXME
>> .\" What is "ioaccel"?  This string appears nowhere in man-pages HEAD.
>> This attribute is for ioaccel-enabled volumes.
>> Contains 1 if ioaccel is enabled for the volume and 0 otherwise.
>
> ioaccel  is  an  alternative driver submission path that allows the
> driver to send  I/O  requests  directly  to  backend  SCSI  devices
> bypassing   the  controller  firmware.  This  results  in  an
> increase in performance. This method is used  for  HBA  disks
> and for LOGICAL VOLUMES comprised of SSDs.

Thanks. I added that text to the page.

>> .IP
>> For example:
>> .IP
>> .in +2n
>> .EX
>> $ \c
>> .B cat /sys/class/scsi_disk/1:0:3:0/device/ssd_smart_path_enabled
>> 0
>> .EE
>> .in
>> .SH VERSIONS
>> The
>> .B smarpqi
>> driver was added in Linux 4.9.
>> .SH NOTES
>> .SS Configuration
>> To configure Microsemi Smart Family controllers, please refer to the
>> controller's User Guide documentation.
>> .\" FIXME
>> .\" Does this manual have a title?  Is it freely available online?
>> .\" Does it have a stable URL?  Can this information be moved to the SEE
>> .\" ALSO section?
>
> To configure Microsemi Smart Family controllers, please refer to the
> controller=E2=80=99s Installation and User=E2=80=99s Guide documentation =
which can be found by
> searching for the controller at https://storage.microsemi.com/

What exactly does one search for? I could not easily find the User's Guide.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
