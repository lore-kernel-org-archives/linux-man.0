From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: +
	prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
	.patch added to -mm tree
Date: Wed, 17 Aug 2011 16:16:41 +0200
Message-ID: <20110817141641.GA15503@redhat.com>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org> <20110817115543.GA8745@redhat.com> <20110817130531.GA12204@redhat.com> <CAPXgP10A4rcQLht--h1d3PJE=oOrm=MSjGXTUSKVF+ssnkt_gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPXgP10A4rcQLht--h1d3PJE=oOrm=MSjGXTUSKVF+ssnkt_gw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/17, Kay Sievers wrote:
>
> On Wed, Aug 17, 2011 at 15:05, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > But, I seem to remember, that patch cleared ->child_reaper on exec,
>
> I don't think he original patch did.
>
> > I think this makes sense.
>
> Why would it? Systemd can serialize its state and properly re-exec
> itself as many times as needed during its lifetime. Why would the
> kernel take something away from a process, which it explicitly asked
> for?
>
> > And I am not sure about security. No, I do not see any problems, just
> > I don't know. Say, should we check the creds during reparenting? I
> > dunno.
>
> Hmm, I don't see why that would be necessary. It's just one of our
> parents that aks for our signals.

Oh, I do not know. I do not pretend I understand the security ;)

For example. I simply can't understand why do we have security_task_wait().
Why waitpid(my_natural_child) can fail for security reasons? But we have
selinux_task_wait().



So, once again. I am not arguing. I am only asking the questions.
I didn't mean I see any problem here.

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
