From: Andreas Schwab <schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: abort might not flush all open streams before process termination
Date: Wed, 07 Oct 2015 12:18:45 +0200
Message-ID: <mvma8rv6kxm.fsf@hawking.suse.de>
References: <560e717f.+EOSyvrXa02mQ6Bg%schwab@linux-m68k.org>
	<87twq4p9f4.fsf@kepler.schwinge.homeip.net>
	<mvmlhbg8e0g.fsf@hawking.suse.de>
	<87oagcp6kc.fsf@kepler.schwinge.homeip.net>
	<mvm612k8b57.fsf@hawking.suse.de>
	<871td7ouju.fsf@kepler.schwinge.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <871td7ouju.fsf-clhehnSHAb8h2wMQzzS6eAmar9SRMdY1rE5yTffgRl4@public.gmane.org> (Thomas Schwinge's
	message of "Wed, 7 Oct 2015 12:13:41 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Schwinge <thomas-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, gcc-/MQLu3FmUzdAfugRpC6u6w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gcc-patches-/MQLu3FmUzdAfugRpC6u6w@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thomas Schwinge <thomas-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org> writes:

> On Tue, 06 Oct 2015 13:55:00 +0200, Andreas Schwab <schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> Thomas Schwinge <thomas-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org> writes:
>> 
>> > | The two regressed test cases use __builtin_printf instead of fprintf to
>> > | stderr, but as far as I know, abort is to flush all open streams before
>> > | process termination?
>> 
>> It can't, since abort must be async-signal-safe.
>
> It's still surprising to me that the message written to stderr is lost in
> your aarch64-suse-linux-gnu configuration (only): from a quick look,
> (current) glibc's stdlib/abort.c tries to actually close/flush all open
> streams before process termination.

This is <https://sourceware.org/bugzilla/show_bug.cgi?id=15436>.

Andreas.

-- 
Andreas Schwab, schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
