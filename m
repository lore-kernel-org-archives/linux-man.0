From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: + prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
 .patch added to -mm tree
Date: Thu, 18 Aug 2011 15:22:06 -0700
Message-ID: <CA+55aFyFnMRMuWSSpytwvpk9u5YysMRfTRELyhGX9grWbGyi6Q@mail.gmail.com>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org>
 <20110817115543.GA8745@redhat.com> <CAPXgP12rYf2HmmsJAuJw=nrtcjTRR1WzDhLNM47eKhKA1UTfJQ@mail.gmail.com>
 <20110817134516.GA14136@redhat.com> <20110818124353.GA2839@tango.0pointer.de>
 <20110818142508.GA30959@redhat.com> <1313691091.1107.9.camel@mop>
 <CA+55aFxGDbNOhNQJe_LpUMcJCGcW8qFFWzC9H0_KW26Xzb0cXw@mail.gmail.com> <1313704516.15082.5.camel@mop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1313704516.15082.5.camel@mop>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lennart Poettering <mzxreary-uLTowLwuiw4b1SvskN2V4Q@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Aug 18, 2011 at 2:55 PM, Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org> wro=
te:
>
>> So NAK. We're not slowing down normal code for some new feature that
>> realistically will never be used by any normal applications.
>
> It will be used for all new service managers. UNIX is a pain if you w=
ant
> to watch your children regarding double-forking, if you are not init.

I'll believe that "all new service managers" when I see it. Until
then, a new feature is just that - a new feature. Which nobody uses.

> And it will clean up the mess the desktop stuff is putting in 'ps afx=
'.
> Here is the before/after output:
>
> =A0253 ? =A0 =A0 =A0 =A0Ss =A0 =A0 0:00 /bin/dbus-daemon --system --a=
ddress=3Dsystemd: --nofork --systemd-activation
> =A0294 ? =A0 =A0 =A0 =A0Sl =A0 =A0 0:00 /usr/libexec/polkit-1/polkitd
> =A0328 ? =A0 =A0 =A0 =A0S =A0 =A0 =A00:00 /usr/sbin/modem-manager
> =A0608 ? =A0 =A0 =A0 =A0Sl =A0 =A0 0:00 /usr/libexec/colord
> =A0658 ? =A0 =A0 =A0 =A0Sl =A0 =A0 0:00 /usr/libexec/upowerd
> =A0819 ? =A0 =A0 =A0 =A0Sl =A0 =A0 0:00 /usr/libexec/imsettings-daemo=
n
> =A0916 ? =A0 =A0 =A0 =A0Sl =A0 =A0 0:00 /usr/libexec/udisks-daemon
> =A0917 ? =A0 =A0 =A0 =A0S =A0 =A0 =A00:00 =A0\_ udisks-daemon: not po=
lling any devices
>
>
> =A0294 ? =A0 =A0 =A0 =A0Ss =A0 =A0 0:00 /bin/dbus-daemon --system --a=
ddress=3Dsystemd: --nofork --systemd-activation
> =A0426 ? =A0 =A0 =A0 =A0Sl =A0 =A0 0:00 =A0\_ /usr/libexec/polkit-1/p=
olkitd
> =A0449 ? =A0 =A0 =A0 =A0S =A0 =A0 =A00:00 =A0\_ /usr/sbin/modem-manag=
er
> =A0635 ? =A0 =A0 =A0 =A0Sl =A0 =A0 0:00 =A0\_ /usr/libexec/colord
> =A0705 ? =A0 =A0 =A0 =A0Sl =A0 =A0 0:00 =A0\_ /usr/libexec/upowerd
> =A0959 ? =A0 =A0 =A0 =A0Sl =A0 =A0 0:00 =A0\_ /usr/libexec/udisks-dae=
mon
> =A0960 ? =A0 =A0 =A0 =A0S =A0 =A0 =A00:00 =A0| =A0 \_ udisks-daemon: =
not polling any devices
> =A0977 ? =A0 =A0 =A0 =A0Sl =A0 =A0 0:00 =A0\_ /usr/libexec/packagekit=
d

Yeah, that looks like a nice feature.

> If you want, we can make the forked processes inherit a flag if the
> 'subreaper' should be looked up at all. Then we have almost zero
> overhead if the feature isn't used. You think that's needed?

Yes, I do. Because with any current system, that "almost zero
overhead" is just totally wasted effort entirely for zero gain. Which
just makes me go "Eww".

             Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
