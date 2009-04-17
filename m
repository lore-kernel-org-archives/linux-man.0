From: Gueven Bay <gueven.bay-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Would like to contribute .. but first some questions
Date: Fri, 17 Apr 2009 10:54:21 +0200
Message-ID: <13413b8f0904170154x2ecf8135kad34b5099978aaa5@mail.gmail.com>
References: <13413b8f0904160811k77b142eag3c3a2d85915f4174@mail.gmail.com>
	 <cfd18e0f0904161656v61bf468eu63188a54c2c8fe45@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0904161656v61bf468eu63188a54c2c8fe45-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2009/4/17 Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>:
> Hi Gueven,
>
> On Fri, Apr 17, 2009 at 3:11 AM, Gueven Bay <gueven.bay-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> Hello,
>>
>> I would like to contribute to the man-pages project but I have some questions.
>>
>> 1) If I use the "Advanced Search" of the bugzilla and choose under
>> Product "Documentation"
>> and und er Component "man-pages" then I get only three bugs - #10356 ,
>> #12919 and
>> #12726 - .
>
> If you'd like to help (and that would be much appreciated!), then the
> following page gives many pointers:
> http://www.kernel.org/doc/man-pages/contributing.html
> In particular, you might try grepping the man pages source for the string FIXME.

Hi Michael,

Thanky you for your answer.

If I understand you correctly then your answer means that I do not have to look
into bugzilla to see which current problems the man-pages have, right!?
(But nevertheless i would like to have some direct answer for my
bugzilla problem,
please.)

Okay.

But with your answer I can not see how my two other questions are solved.
Because the page you linked above - contributing.html - does not
answer my questions.

So I want to quote these in the hope that they will be solved (in
parentheses I try to
make the problems somewhat clearer if the questions were not understandable).

>> 2) I would like to contribute man pages for drivers like the
>> (Free|Net|Open)BSD man pages have.
>> Here
>> http://www.kernel.org/doc/man-pages/online/dir_section_4.html
>> are no driver man pages like for example these listed :
>> http://www.freebsd.org/cgi/man.cgi?query=aha&sektion=4&apropos=0&manpath=FreeBSD+7.1-RELEASE
>> (Adaptec SCSI host adapter driver)
>> http://www.freebsd.org/cgi/man.cgi?query=aue&sektion=4&apropos=0&manpath=FreeBSD+7.1-RELEASE
>> (ADMtek AN986 Pegasus USB Ethernet driver)
>> Do you not have such driver man pages because of missing contributers  who write these
>> or
>> is there some "technical" reason that such man pages are or maybe cannot be written?

(Maybe there are no driver man pages because this project will not in
any form include them in its
releases - for whatever reason -
maybe it is only because no one ever wrote a driver man page. But what
is the real reason?
If I write some will it go into the man pages project or should I
collect them in my own repo.)

>> 3) On which version of the kernel/glibc do you write the man pages?
>> The current stable version? Or
>> the development trunk (head) of the kernel and glibc?

( Do you use kernel 2.6.29 for writing the man pages or is the actual
man-pages project
"stuck" in an older version like 2.6.19 or so - for some technical
reason like "stability" or so - ?
What is the case with glibc? Do you check out the newest development
tree or use some distro specific
version? )


Thanks and regards
Gueven
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
