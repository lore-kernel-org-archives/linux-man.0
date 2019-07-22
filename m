From: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH glibc] Linux: Include <linux/sockios.h> in <bits/socket.h> under __USE_MISC
Date: Mon, 22 Jul 2019 15:44:39 +0200
Message-ID: <87lfwqqj3s.fsf@oldenburg2.str.redhat.com>
References: <87ftmys3un.fsf@oldenburg2.str.redhat.com>
	<CAK8P3a0hC4wvjwCi4=DCET3C4qARMY6c58ffjwG3b1ZPM6kr-A@mail.gmail.com>
	<2431941f-3aac-d31f-e6f5-8ed2ed7b2e5c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <libc-alpha-return-103877-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <2431941f-3aac-d31f-e6f5-8ed2ed7b2e5c@arm.com> (Szabolcs Nagy's
	message of "Mon, 22 Jul 2019 13:41:07 +0000")
To: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, nd <nd@arm.com>, GNU C Library <libc-alpha@sourceware.org>, Sergei Trofimovich <slyfox@gentoo.org>, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Michael Kerrisk <mtk.manpages@gmail.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

* Szabolcs Nagy:

> (note: in musl these ioctl macros are in sys/ioctl.h
> which is not a posix header so namespace rules are
> less strict than for sys/socket.h and users tend to
> include it for ioctl())

<sys/ioctl.h> can be confusing because some of the constants may depend
on types that aren't declared by including the header.  This makes their
macros unusable.  Defining ioctl constants in headers which also provide
the matching types avoids that problem at least, also it can introduce
namespace issues.

Thanks,
Florian
