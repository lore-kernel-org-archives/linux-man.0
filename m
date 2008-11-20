From: Cedric Le Goater <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
Subject: Re: CLONE_NEWIPC documentation
Date: Thu, 20 Nov 2008 13:26:05 +0100
Message-ID: <4925575D.8060704@fr.ibm.com>
References: <4924651C.4080909@gmail.com> <m163mji4cz.fsf@frodo.ebiederm.org> <49252174.7080709@fr.ibm.com> <cfd18e0f0811200328g643c1bdq46a48bac3a1ea744@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811200328g643c1bdq46a48bac3a1ea744-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Kirill Korotaev <dev-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Pavel Emelianov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:
> Cedric,
> 
> On Thu, Nov 20, 2008 at 3:36 AM, Cedric Le Goater <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org> wrote:
>> Eric W. Biederman wrote:
>>> Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>>>
>>>> Kirill, Pavel,
>>>>
>>>> Below is a patch to document the CLONE_NEWIPC flag that was
>>>> added in 2.6.19.
>>>>
>>>> Could you please review and let me know of improvements
>>>> or inaccuracies?
>> I would also add that an interesting effect of the sysvipc namespace is
>> the automatic cleanup of sysvipc objects when the namespace is destroyed.
> 
> And the namespace is destroyed, when the last proces in the namespace
> terminates, right?

exactly.

Thanks,

C.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
