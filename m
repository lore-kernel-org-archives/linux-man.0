From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: CLONE_NEWIPC documentation
Date: Thu, 20 Nov 2008 11:28:14 -0500
Message-ID: <cfd18e0f0811200828x5c1752dcmef1cd6d52bdc08ce@mail.gmail.com>
References: <4924651C.4080909@gmail.com> <m163mji4cz.fsf@frodo.ebiederm.org>
	 <49252174.7080709@fr.ibm.com>
	 <cfd18e0f0811200328g643c1bdq46a48bac3a1ea744@mail.gmail.com>
	 <4925575D.8060704@fr.ibm.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4925575D.8060704-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cedric Le Goater <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Kirill Korotaev <dev-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Pavel Emelianov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Nov 20, 2008 at 7:26 AM, Cedric Le Goater <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org> wrote:
> Michael Kerrisk wrote:
>> Cedric,
>>
>> On Thu, Nov 20, 2008 at 3:36 AM, Cedric Le Goater <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org> wrote:
>>> Eric W. Biederman wrote:
>>>> Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>>>>
>>>>> Kirill, Pavel,
>>>>>
>>>>> Below is a patch to document the CLONE_NEWIPC flag that was
>>>>> added in 2.6.19.
>>>>>
>>>>> Could you please review and let me know of improvements
>>>>> or inaccuracies?
>>> I would also add that an interesting effect of the sysvipc namespace is
>>> the automatic cleanup of sysvipc objects when the namespace is destroyed.
>>
>> And the namespace is destroyed, when the last proces in the namespace
>> terminates, right?
>
> exactly.

Thanks Cedric.  I've added that point to the documentation.

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
