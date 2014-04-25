From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] fanotify: create manpages
Date: Fri, 25 Apr 2014 20:10:25 +0200
Message-ID: <535AA511.8000308@gmail.com>
References: <1398370691-13971-1-git-send-email-xypron.glpk@gmx.de> <535A3C3E.8050400@gmail.com> <535A7AF2.3030501@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <535A7AF2.3030501-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/25/2014 05:10 PM, Heinrich Schuchardt wrote:
> On 25.04.2014 12:43, Michael Kerrisk (man-pages) wrote:
>> Some things I'd like you to check or fix:
>> * Please review 679a078389 (ETXTBUSY)
> ok
> 
>> * Please review 3b32c70be9 (FAN_MARK_FLUSH bug)
> a period ('.') is missing at the end of the sentence.
> You received a patch.

Thanks.

>> * See the FIXME in the example code in fanotify(7).
> My understanding is, that file descriptors are always positive.
> Please, correct me if I am wrong. Comparing to FAN_NOFD would
> be a valid alternative.

You're right. It's just that comparing to FAN_NOFD seemed to me
to be a little more transparent. I.e., "[if not queue overflow]"

> You are right that queue overflow is not notified to the user.
> But it is not necessary for the listener to take any action in case
> of a queue overflow.

Fair enough. But I think a comment explaining what goes on might
be helpful. I added one.

>> * The readdir(2) / FAN_ACCESS bug is described in fanotify(7)
>>    and fanotify_mark(7). It only needs to be in one of the pages.
>>    Could you patch to remove whichever you think should be removed.
> Patch provided

Thanks.

>> An earlier question that I believe is still not resolved:
>>
>> [[
>>> ' Now I know that I earlier said that FAN_ONDIR and FAN_EVENT_ON_CHILD
>>> ' belong in the input events for fanotify_mark(), not here in the
>>> ' returned events. Or at least, as far as I can tell, they can't be
>>> ' in the returned events--but can you confirm this please.
>>> Where did you find FAN_ONDIR and FAN_EVENT_ON_CHILD in fanotify.7?
>>
>> They were in an earlier version in fanotify.7, if I recall correctly.
>> Anyway, my point is: have you confirmed that FAN_ONDIR and
>> FAN_EVENT_ON_CHILD are only input flags, and can't be returned as output
>> event flags?
>> ]]
> Verified with test program: FAN_ONDIR and FAN_EVENT_ON_CHILD are not 
> returned as output event flags, when specified fanotify_mark.

Okay -- thanks. My testing also got the same result, but I wanted to
some independent checking.

>> Once we've finished those tweaks, we can pester Eric for a review.
> Let's say invite. Hopefully he is not too busy.

Sure ;-).

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
