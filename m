From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Current state of CLONE_NEWUSER?
Date: Tue, 25 Nov 2008 10:54:49 -0500
Message-ID: <cfd18e0f0811250754x599d5284k6e9372a7b7af347@mail.gmail.com>
References: <cfd18e0f0811191204r4ccaeaf4m4145e67f408543e0@mail.gmail.com>
	 <m1vdujdvi6.fsf@frodo.ebiederm.org>
	 <cfd18e0f0811200349q788c2767i5164dc1c47e67925@mail.gmail.com>
	 <m1zlju9u9z.fsf@frodo.ebiederm.org>
	 <20081121150710.GA10705@us.ibm.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081121150710.GA10705-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Serge E. Hallyn" <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org, herbert-dBHVzrDq9nF4Lj/PQRBjDg@public.gmane.org, dev-3ImXcnM4P+0@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Serge,

On Fri, Nov 21, 2008 at 10:07 AM, Serge E. Hallyn <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> wrote:
> Quoting Eric W. Biederman (ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org):
>> "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>>
>> > Hi Eric,
>> >
>> > On Wed, Nov 19, 2008 at 8:41 PM, Eric W. Biederman
>> > <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
>> >> "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>> >>
>> >>> Hi Serge,
>> >>>
>> >>> What is the current status of CLONE_NEWUSER?  I'm currently trying to
>> >>> test this flag in preparation for documenting it in the clone(2) man
>> >>> page, but am running into an ENOMEM error from the clone() call, which
>> >>> seems to occur after a failure in kobject_init_and_add() in the
>> >>> following call sequence:
>> >>>
>> >>> clone_user_ns() --> alloc_uid() --> uids_user_create() -->
>> >>> kobject_init_and_add()
>> >>>
>> >>> Are there already some test programs somewhere?  Is there any
>> >>> documentation already available for this flag?
>> >>
>> >> This code is definitely still under development.
>> >>
>> >> When complete it should be able to create a new uid namespace,
>> >> as an unprivileged user.  Creating a new process with uid == gid == 0.
>> >> Have a full set of caps.  And have permission to do nothing on the system
>> >> except read world readable files and write world writable files.
>> >
>> > Thanks for the info,
>> >
>> > So the error I described is expected?
>>
>> I don't think so.  Serge?
>
> I suspect you have the fair scheduler compiled in
> (CONFIG_FAIR_GROUP_SCHED).

True.

> So when you create a new user namespace, it
> tries to create a new /sys/kernel/uids/0 (or thereabouts) directory
> which sysfs refuses.

Okay.

> The fix for this was rolled in as the last patch in the rejected large
> network namespace/sysfs rework.  So we'll need another fix.  I suspect
> following the same path as we did for making network namespaces work is
> the best path for now.  (This being my last day of a week-long vacation
> I won't be sending a patch today :)

Yep, I saw your patch, thanks.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
