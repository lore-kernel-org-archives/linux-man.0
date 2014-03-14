From: Mike Christie <mchristie-5c4llco8/ftWk0Htik3J/w@public.gmane.org>
Subject: Re: SuSE O_DIRECT|O_NONBLOCK overload
Date: Fri, 14 Mar 2014 12:46:43 -0500
Message-ID: <53234083.3060307@fusionio.com>
References: <20140130132620.GA6031@infradead.org> <20140130132630.GB6031@infradead.org> <x49iorp3fhm.fsf@segfault.boston.devel.redhat.com> <20140308155240.GA32297@infradead.org> <CAMM=eLewbtK7LiNZCXo=hm-sjVU2+MN+xTFuxb89mDA1iS3r0w@mail.gmail.com> <531B74B6.4070004@suse.de>	<20140312102849.GA26509@infradead.org> <53203BE5.402@suse.de>	<20140312110015.GA29907@infradead.org> <20140313111555.2f15f19f@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140313111555.2f15f19f-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/12/2014 07:15 PM, NeilBrown wrote:
> I also think there should probably be just one FAILFAST flag.  Where it was
> the DEV or the TRANSPORT or the DRIVER that failed could be returned in the
> error code for any caller that cared.  But as I don't know why the one became
> three I could well be missing something important.

It was for multipath. The problem was dm-multipath does not know what to
do with low level device errors, but wanted transport errors returned
quickly. Other drivers like the scsi_dh (formerly dm hardware handlers)
modules, want all errors fast failed.

I can add documentation or we can just change the code to better suite
your needs.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
