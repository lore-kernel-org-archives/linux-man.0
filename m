From: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace(2) man page
Date: Thu, 25 Apr 2013 17:36:48 +0200
Message-ID: <51794D90.9010308@redhat.com>
References: <20130417113933.GA11499@osiris> <CAKgNAkgNWcgO=0hkn2pytk6MZ40vE=vN1T6JJ6rEvt53kW9-tw@mail.gmail.com> <878v48htoh.fsf@br87z6lw.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <878v48htoh.fsf-MJW0/vCo2v25SqV9CvDRx0EOCMrvLtNR@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Arnez <arnez-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/24/2013 04:47 PM, Andreas Arnez wrote:
>> On Wed, Apr 17, 2013 at 1:39 PM, Heiko Carstens
>>> So, what do you think? Should these architecture specific details go
>>> into the ptrace(2) man page?
>>> Or somewhere else? Like e.g. Documentation/<arch>/ptrace.txt in the kernel?
>>> Or maybe an arch specific "sub" man page like e.g. ptrace.<arch>?
>>
>> I am not sure, mainly because I am not familiar with the extent of the
>> architecture-specific variation in ptrace(2). I do see that there is
>> just a very little arch-specific detail in the man page (x86, SPARC).
>> I am not (yet) sure of the way forward.
> 
> Per architecture there would potentially be a few hundred lines of
> additional documentation.  For example, the various register sets could
> be enumerated and their layout summarized.

I would add this information only after someone asks for it.
That is, if there is a demonstrated interest in having it documented.

> And all the
> architecture-specific ptrace requests could be explained.
> 
>> I have CCed Denys Vlasenko, since in recent times he has done a lot of
>> work on this page, and I assume has a lot of familiarity with the
>> various arch-specific details. Perhaps he has an opinion.
> 
> Denys, do you have an opinion?

> On Wed, Apr 17, 2013 at 1:39 PM, Heiko Carstens wrote:
>> we are just wondering where we should document the s390 specific ptrace
>> interface.
>> The natural answer seems to be "in the man page", however when reading the
>> ptrace(2) man page it hardly mentions any architecture dependent details.

I think that creating a S390 subsection in ptrace manpage and putting
information there is not a bad idea. This way all the info stays in one,
easily accessible place. (The downside is that modifying it is a PITA.)

I just think you should be reasonably terse while doing so.
Don't painstakingly describe those parts which are obvious.
For example, documenting PTRACE_POKEUSER / PTRACE_PEEKUSER's structure
can be done this way:

"""
struct user_offsets {
	uint64_t psw_mask;
	uint64_t psw_addr;
	uint64_t gpr0;	/* General purpose register #0 */
	uint64_t gpr1;	/* General purpose register #1 */
	uint64_t gpr2;	/* General purpose register #2 */
	uint64_t gpr3;	/* General purpose register #3 */
	uint64_t gpr4;	/* General purpose register #4 */
	uint64_t gpr5;	/* General purpose register #5 */
	uint64_t gpr6;	/* General purpose register #6 */
	uint64_t gpr7;	/* General purpose register #7 */
	uint64_t gpr8;	/* General purpose register #8 */
	uint64_t gpr9;	/* General purpose register #9 */
	uint64_t gpr10;	/* General purpose register #10 */
	uint64_t gpr11;	/* General purpose register #11 */
	uint64_t gpr12;	/* General purpose register #12 */
	uint64_t gpr13;	/* General purpose register #13 */
	uint64_t gpr14;	/* General purpose register #14 */
	uint64_t gpr15;	/* General purpose register #15 */
...
}
"""

but it's probably not a good idea. Use common sense. Compress
the explanation to a more manageable size.

Maybe even ask yourself "did anyone ask for PTRACE_PEEKUSER layout yet?
Do we really need to document it? Maybe people find this info
in headers / strace source / etc, and are fine as-is?"


>> Especially the _exact_ semantics of each ptrace command including all data
>> structures etc. are missing.

Can you be more specific?

-- 
vda

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
