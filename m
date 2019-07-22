From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH glibc] Linux: Include <linux/sockios.h> in <bits/socket.h>
 under __USE_MISC
Date: Mon, 22 Jul 2019 13:34:48 +0200
Message-ID: <CAK8P3a0hC4wvjwCi4=DCET3C4qARMY6c58ffjwG3b1ZPM6kr-A@mail.gmail.com>
References: <87ftmys3un.fsf@oldenburg2.str.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87ftmys3un.fsf@oldenburg2.str.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Weimer <fweimer@redhat.com>
Cc: GNU C Library <libc-alpha@sourceware.org>, Sergei Trofimovich <slyfox@gentoo.org>, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Michael Kerrisk <mtk.manpages@gmail.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Mon, Jul 22, 2019 at 1:31 PM Florian Weimer <fweimer@redhat.com> wrote:
>
> Historically, <asm/socket.h> (which is included from <bits/socket.h>)
> provided ioctl operations for sockets.  User code accessed them
> through <sys/socket.h>.  The kernel UAPI headers have removed these
> definitions in favor of <linux/sockios.h>.  This commit makes them
> available via <sys/socket.h> again.

Looks good to me.

I wonder if we should still do these two changes in the kernel:

- include asm/socket.h from linux/socket.h for consistency
- move the defines that got moved from asm/sockios.h to linux/sockios.h
  back to the previous location to help anyone who is user
  newer kernel headers with older glibc headers.

      Arnd
