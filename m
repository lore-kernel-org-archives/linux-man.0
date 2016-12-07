From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] sock_diag.7: New page documenting
 NETLINK_SOCK_DIAG interface
Date: Wed, 7 Dec 2016 16:58:24 +0100
Message-ID: <CAKgNAkg+qNKbkyS2S=CPj5LgG8O2TSV2oXU=U5VwSy6O3fGWUQ@mail.gmail.com>
References: <20161207135943.GC1100@altlinux.org> <447179de-e8a9-92aa-9196-b3e11ebbb11d@gmail.com>
 <20161207155727.GB2272@altlinux.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161207155727.GB2272-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 7 December 2016 at 16:57, Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org> wrote:
> On Wed, Dec 07, 2016 at 04:15:25PM +0100, Michael Kerrisk (man-pages) wrote:
>> On 12/07/2016 02:59 PM, Dmitry V. Levin wrote:
>> > From: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
>> >
>> > Co-authored-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
>> > Signed-off-by: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
>> > Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
>>
>> Thank you, Pavel and Dmitry, for all the work that went into this page!
>> I've applied and pushed to Git. I made a lot of trivial edits
>> to the page. You may want to review it, but I don't think
>> I broke anything.
>
> Yes, it looks fine, thanks a lot!

Thanks for checking.

>> Perhaps the most notable change was to consistently
>> replace "protocol family" by "address family".
>
> This is definitely more consistent with use of AF_* names instead of PF_*.

Good.

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
