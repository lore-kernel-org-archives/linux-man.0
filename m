From: Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: + prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
 .patch added to -mm tree
Date: Wed, 17 Aug 2011 18:03:26 +0200
Message-ID: <CAK1hOcObOmC-rfAZY6sUX98VZZpDn6+6XrUDJ_nFFGHROEYniQ@mail.gmail.com>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org>
 <20110817115543.GA8745@redhat.com> <20110817130531.GA12204@redhat.com> <CAPXgP10A4rcQLht--h1d3PJE=oOrm=MSjGXTUSKVF+ssnkt_gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPXgP10A4rcQLht--h1d3PJE=oOrm=MSjGXTUSKVF+ssnkt_gw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Aug 17, 2011 at 3:21 PM, Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org> wro=
te:
> On Wed, Aug 17, 2011 at 15:05, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> On 08/17, Oleg Nesterov wrote:
>>> On 08/16, Andrew Morton wrote:
>>> > From: Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
>>> >
>>> > Userspace service managers/supervisors need to track their starte=
d
>>> > services. =A0Many services daemonize by double-forking and get im=
plicitely
>>> > re-parented to PID 1. =A0The process manager will no longer be ab=
le to
>>> > receive the SIGCHLD signals for them.
>>> >
>>> > With this prctl, a service manager can mark itself as a sort of '=
sub-init'
>>> > process, able to stay as the parent process for all processes cre=
ated by
>>> > the started services. =A0All SIGCHLD signals will be delivered to=
 the
>>> > service manager.
>>>
>>> I try to never argue with the new features. But to be honest, this
>>> doesn't look very good to me.
>>>
>>> OK, a service manager M does prctl(PR_SET_CHILD_REAPER), then it fo=
rks
>>> a service X which forks another child C and exits. Then C exits and
>>> notifies M.
>>>
>>> But. How can M know that the service X should be restarted? It only
>>> knows the pid. What if wait(WEXITED) succeeds because C in turn doe=
s
>>> fork + exit? What M has 2 or more services?
>>
>> Also. I am almost sure I have already reviewed a very similar patch
>> a long ago.
>
> It's almost the same.
>
>> Ungortunately, I can't find the previous discussion, and
>> I can't recall why that patch was not accepted.
>
> We've just been busy with other things. But now that systemd will not
> only be PID 1 but also the process parent for every user logged into
> the system, we need this functionality.

Getty and login worked rather well for 40+ years.
You need to stop trying to supplant every traditional Unix utility
with systemd. This is becoming ridiculous.
You have is a hammer, everything looks like a nail to you.
Where will you stop?

--=20
vda
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
