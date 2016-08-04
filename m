From: Steven Munroe <munroesj@linux.vnet.ibm.com>
Subject: Re: [patch] getauxval.3 correct AT_HWCAP result description
Date: Thu, 04 Aug 2016 15:35:43 -0500
Message-ID: <1470342943.15257.1.camel@oc7878010663>
References: <397D95928DECEF49983F5B237627E9785733058A@IRSMSX108.ger.corp.intel.com>
	 <2b181d0f-3a50-bf18-268b-9991de75d216@gmail.com> <5785F835.4070209@arm.com>
Reply-To: munroesj@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-72298-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <5785F835.4070209@arm.com>
To: Szabolcs Nagy <szabolcs.nagy@arm.com>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "Cownie, James
 H" <james.h.cownie@intel.com>, nd@arm.com, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Wed, 2016-07-13 at 09:13 +0100, Szabolcs Nagy wrote:
> On 12/07/16 21:24, Michael Kerrisk (man-pages) wrote:
> >>  .BR AT_HWCAP
> >> -A pointer to a multibyte mask of bits whose settings
> >> +A four byte long bit-mask whose settings
> >>  indicate detailed processor capabilities.
> 
> why is it four byte long?
> 
> it's a long and the target abi decides how many
> bits of that is used.
> 

For platforms that support 32- and 64-bit modes, maintaining AT_HWCAP at
32-bits simplifies code portability.
