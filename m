From: Phil Blundell <pb@pbcl.net>
Subject: Re: [PATCH] Add Prefer_MAP_32BIT_EXEC to map executable pages with
 MAP_32BIT
Date: Wed, 16 Dec 2015 14:16:53 +0000
Message-ID: <1450275413.1472.215.camel@pbcl.net>
References: <CAMe9rOo1OBOGruWMoLTx96wnkKUYPzBZ5HcOCFdGJEp+jTRzVA@mail.gmail.com>
	 <56716EDC.7020205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-65687-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <56716EDC.7020205@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "H.J. Lu" <hjl.tools@gmail.com>, Carlos O'Donell <carlos@redhat.com>, linux-man <linux-man@vger.kernel.org>
Cc: Jeff Law <law@redhat.com>, Zack Weinberg <zackw@panix.com>, Andi Kleen <andi@firstfloor.org>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On Wed, 2015-12-16 at 15:02 +0100, Michael Kerrisk (man-pages) wrote:
> 
> NB: MAP_32BIT will map to the low 2GB (not 2GB) of  the  address
> space.

Isn't that meant to say "not 4GB"?

p.
