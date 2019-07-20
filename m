From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-headers-5.2 and proper use of SIOCGSTAMP
Date: Sat, 20 Jul 2019 20:50:23 +0200
Message-ID: <CAK8P3a3s3OeBj1MviaJV2UR0eUhF0GKPBi1iFf_3QKQyNPkuqw@mail.gmail.com>
References: <20190720174844.4b989d34@sf> <87wogca86l.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <libc-alpha-return-103847-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <87wogca86l.fsf@mid.deneb.enyo.de>
To: Florian Weimer <fw@deneb.enyo.de>
Cc: Sergei Trofimovich <slyfox@gentoo.org>, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>, "David S. Miller" <davem@davemloft.net>, Michael Kerrisk <mtk.manpages@gmail.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jul 20, 2019 at 8:10 PM Florian Weimer <fw@deneb.enyo.de> wrote:
>
> * Sergei Trofimovich:
>
> > Should #include <linux/sockios.h> always be included by user app?
> > Or should glibc tweak it's definition of '#include <sys/socket.h>'
> > to make it available on both old and new version of linux headers?
>
> What is the reason for dropping SIOCGSTAMP from <asm/socket.h>?
>
> If we know that, it will be much easier to decide what to do about
> <sys/socket.h>.

As far as I can tell, nobody thought it would be a problem to move it
from asm/sockios.h to linux/sockios.h, as the general rule is that one
should use the linux/*.h version if both exist, and that the asm/*.h
version only contains architecture specific definitions. The new
definition is the same across all architectures, so it made sense to
have it in the common file.

If the assumption was wrong, the obvious solution is to duplicate the
definitions everywhere or move the common parts into
asm-generic/sockios.h, but it would have been better to hear about
that earlier.

      Arnd
