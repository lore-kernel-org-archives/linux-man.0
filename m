From: Szabolcs Nagy <szabolcs.nagy@arm.com>
Subject: Re: [patch] getauxval.3 correct AT_HWCAP result description
Date: Wed, 13 Jul 2016 09:13:41 +0100
Message-ID: <5785F835.4070209@arm.com>
References: <397D95928DECEF49983F5B237627E9785733058A@IRSMSX108.ger.corp.intel.com> <2b181d0f-3a50-bf18-268b-9991de75d216@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <libc-alpha-return-71746-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <2b181d0f-3a50-bf18-268b-9991de75d216@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "Cownie, James H" <james.h.cownie@intel.com>
Cc: nd@arm.com, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 12/07/16 21:24, Michael Kerrisk (man-pages) wrote:
>>  .BR AT_HWCAP
>> -A pointer to a multibyte mask of bits whose settings
>> +A four byte long bit-mask whose settings
>>  indicate detailed processor capabilities.

why is it four byte long?

it's a long and the target abi decides how many
bits of that is used.
