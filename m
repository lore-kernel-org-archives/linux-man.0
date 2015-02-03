From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Subject: Re: [PATCH v3 1/1] ioctl-fat.2: new manpage for the ioctl fat API
Date: Tue, 03 Feb 2015 18:44:46 +0900
Message-ID: <87fvane3ch.fsf@mail.parknet.co.jp>
References: <CAKgNAkhuGYKtUKkm2+wU+TwQb6iZ+EmnLDdr4qg4fWHJyL9K5A@mail.gmail.com>
	<1422042884-10824-1-git-send-email-xypron.glpk@gmx.de>
	<CAKgNAkibtVVFS8Q7gwyn8t7B_qDTALtJ6K0H1rfecqb_p-AR6Q@mail.gmail.com>
	<87k2zze5tg.fsf@mail.parknet.co.jp>
	<CAKgNAkhrvdAauGAQOukGQ6B8MJ3kbYWivvrzzMJMaQOKsCq4sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkhrvdAauGAQOukGQ6B8MJ3kbYWivvrzzMJMaQOKsCq4sA@mail.gmail.com>
	(Michael Kerrisk's message of "Tue, 3 Feb 2015 10:24:42 +0100")
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com> writes:

>> Quick reviewed, and looks good. However, entry[0].d_reclen == 0 works as
>> backward compatibility though. The example might be good to use usual
>> way of getdents().
>>
>> I.e., "ret" means
>>         -1 == error
>>         0  == EOD
>>         0  >  how many bytes read
>
> Sorry -- I do not really understand what you mean here
> "entry[0].d_reclen == 0 works as backward compatibility though"). Is
> the line
>
>                     if (ret == -1 || entry[0].d_reclen == 0)
>
> incorrect? If yes, what should the code look like?

Sorry. I meant, "entry[0].d_reclen == 0" check works because fatfs still
have backward compatibility code. However it would not be preferred way.

In ancient version, fatfs didn't return proper return code, so apps (I
know only use is wine) had to check "entry[0].d_reclen == 0" to know
EOD.

But for a long time, fatfs returns proper return code like said in
previous email (previous email was wrong on "0 > how many bytes read",
see below instead). I.e., now user can use "ret" as similar to
getdents(), user can know the result as usual from "ret" without
"entry[0].d_reclen == 0".

	while (1) {
		ret = ioctl();
	        if (ret == -1) {
	        	/* error */

		if (ret == 0)
			/* EOD */

	       	/* got entry (would be ret == 1) */
	}
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
