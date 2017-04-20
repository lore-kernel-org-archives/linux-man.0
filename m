From: Siddhesh Poyarekar <siddhesh@sourceware.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Thu, 20 Apr 2017 18:45:31 +0530
Message-ID: <c31e55fb-25af-bfe9-09db-83e622ec5e3f@sourceware.org>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <22f26755-f7f0-898a-ac74-3f6df92a22d7@sourceware.org>
 <c6736794-60bb-517e-0bcf-2e80331f0f72@gmail.com>
 <eb5bea0c-1f54-1b20-dc78-999160738ed3@sourceware.org>
 <2fab9588-2fa6-8c87-da25-be9376c085ea@redhat.com>
Reply-To: siddhesh@sourceware.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-78791-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <2fab9588-2fa6-8c87-da25-be9376c085ea@redhat.com>
To: Florian Weimer <fweimer@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Cc: linux-man <linux-man@vger.kernel.org>, Carlos O'Donell <carlos@redhat.com>, Rich Felker <dalias@aerifal.cx>, "H.J. Lu" <hjl.tools@gmail.com>
List-Id: linux-man@vger.kernel.org

On Thursday 20 April 2017 06:31 PM, Florian Weimer wrote:
>> Hmm interesting, I thought 'latest' would imply the last version in the
>> sequence of versions in the map, but I guess it kinda makes sense that
>> it is the @@ default, similar to how a static linker would pick it up.
> 
> It might be another instance of bug 12977.  At least its fix will
> involve preferring the default version in this case.  I don't know what

>From Michael's test case it seems like it already is preferring the
default version.  The fix would have to be to the comment that says
prefer the oldest version for regular unversioned lookups and the
*latest* for the dlsym lookups.

That or I misunderstood what you said.

> to do if there is no default version.  We currently do not perform a
> topological sort on the version graph to find the maximum version.

My understanding is that the VERSYM section is set up in a chained
manner and the oldest and the newest can be derived from it.

Siddhesh
