From: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: linux-headers-5.2 and proper use of SIOCGSTAMP
Date: Sat, 20 Jul 2019 20:10:26 +0200
Message-ID: <87wogca86l.fsf@mid.deneb.enyo.de>
References: <20190720174844.4b989d34@sf>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <libc-alpha-return-103846-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <20190720174844.4b989d34@sf> (Sergei Trofimovich's message of
	"Sat, 20 Jul 2019 17:48:44 +0100")
To: Sergei Trofimovich <slyfox@gentoo.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, libc-alpha@sourceware.org, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, mtk.manpages@gmail.com, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

* Sergei Trofimovich:

> Should #include <linux/sockios.h> always be included by user app?
> Or should glibc tweak it's definition of '#include <sys/socket.h>'
> to make it available on both old and new version of linux headers?

What is the reason for dropping SIOCGSTAMP from <asm/socket.h>?

If we know that, it will be much easier to decide what to do about
<sys/socket.h>.
