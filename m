From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] io_cancel.2: fix up the description
Date: Thu, 11 Apr 2013 11:08:42 +0200
Message-ID: <CAKgNAkg0wv=XO7UwpnafE98HNMZrA=jZh4fN+m7UmijwUaroJg@mail.gmail.com>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com>
 <1365104218-26042-2-git-send-email-jmoyer@redhat.com> <CAKgNAki66jwQvKGLDWRomG0-s29EP34MZCoU=eUjHnQsn3x8wA@mail.gmail.com>
 <20130410111422.GB1376@rei.scz.novell.com> <x49ppy2jxkm.fsf@segfault.boston.devel.redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <x49ppy2jxkm.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Apr 10, 2013 at 3:59 PM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> chrubis-AlSwsSmVLrQ@public.gmane.org writes:
>
>> Hi!
>>> > The description for this sytem call was a bit inaccurate.  Cyril
>>> > still takes issue with my wording, so this is up for further
>>> > word-smithing, I think.  I'm open to suggestions.
>>>
>>> Cyril, do you have any comment?
>>
>> It is no big deal but I think that the sentence could be a little clearer
>> with explicitly stating that the ctx_id is aio context and the iocb
>> describes the operation to be canceled. Something like:
>>
>> The
>> .I iocb
>> describes the operation to be canceled and the
>> .I ctx_id
>> is aio context the operation was submitted to.
>
> I agree that this is better.  Thanks Cyril!


So, in the end, I have

       The  iocb  argument  describes the operation to be canceled
       and the ctx_id argument is the AIO  context  to  which  the
       operation  was submitted.

Okay?

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
