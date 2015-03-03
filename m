From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clone.2: Document that clone silently ignores CLONE_PID
 and CLONE_STOPPED
Date: Tue, 03 Mar 2015 08:02:23 +0100
Message-ID: <54F55C7F.10909@gmail.com>
References: <20150227004118.GA15530@jtriplet-mobl1> <54F011E4.1020502@gmail.com> <20150227163157.GA10309@cloud> <CAKgNAkjCvzeo+tHUW+mwL+ptdCX7k=j8fmRX6OtLfFM9HVXJjQ@mail.gmail.com> <20150302164050.GA29046@cloud>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150302164050.GA29046@cloud>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Josh,

On 03/02/2015 05:40 PM, josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org wrote:
> On Mon, Mar 02, 2015 at 05:27:38PM +0100, Michael Kerrisk (man-pages) wrote:
>> On 27 February 2015 at 17:31,  <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org> wrote:
>>> On Fri, Feb 27, 2015 at 07:42:44AM +0100, Michael Kerrisk (man-pages) wrote:
>>>> On 02/27/2015 01:41 AM, Josh Triplett wrote:
>>>>> Normally, system calls return EINVAL for flags they don't support.
>>>>> Explicitly document that clone does *not* produce an error for these two
>>>>> obsolete flags.
>>>>
>>>> Thanks, Josh! Applied.
>>>
>>> Doesn't appear to be in the current git repository.
>>
>> Pushed now, Josh. (I needed to get another release out of the way first.)
> 
> No problem; thanks for the update.
> 
> Related issue: the errors section of clone.2 claims it'll return EPERM
> for CLONE_PID by something other than PID 0 (meaning, outside the
> kernel), but that doesn't actually happen.  Should that be dropped?  (I
> can send a patch if so.)

I'd take a patch to fix that. (But note, if this is kernel behavior
that has changed over time, it would be valuable to document when
the change occurred.)

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
