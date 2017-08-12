From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH man-pages] open.2: improve O_PATH documentation.
Date: Sat, 12 Aug 2017 22:13:12 +0200
Message-ID: <ad4cce6a-f228-9c0a-47b3-e902e4582743@gmail.com>
References: <873790rtni.fsf@notabene.neil.brown.name>
 <20170810102104.GA16888@gardel-login>
 <1502373778.9644.27.camel@sysmikro.com.pl>
 <87mv77qb1x.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <87mv77qb1x.fsf@notabene.neil.brown.name>
Content-Language: en-US
Sender: linux-fsdevel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.com>, =?UTF-8?Q?Krzysztof_B=c5=82aszkowski?= <kb@sysmikro.com.pl>, Lennart Poettering <lennart@poettering.net>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 08/11/2017 01:04 AM, NeilBrown wrote:
> On Thu, Aug 10 2017, Krzysztof Błaszkowski wrote:
> 
>> Mr Poettering,
>>
>>
>> I don't know exactly what is the whole discussion about but Mr
>> consider (very seriously) this regarding C language, C coding,
>> compilers and program execution:
>>
>> claim #1: "==" is compare operator another words result is considered
>> to be true if both arguments are same binary
>>
>> claim #2: it is possible to compare different types to each other, e.g.
>> int to char, long long to short
>>
>> claim #3: if both arguments are of different sizes then compiler
>> extends shorter type to the size of larger argument padding with 0s.
>>
>> claim #4: compiler uses type of variable for immediate constant when
>> comparing the variable to it. thus even bitfields comparisons work.
>>
>> claim #5: the compiler is modern gcc
>>
>> thus your whole thesis is damn crap especially your claim like "Linux
>> is broken". you could write glibc is broken because it does not
>> "expose" (which is not strictly true) the fsword_t 
>>
>> Do you know what the term "Linux" stands for ?
>> I can give you explanation but there are so many other noble developers
>> which can do this better and it is disappointing that they haven't done
>> this yet.
>>
>>
>> I could ignore your email like others did but once upon I gave you a
>> proof that because systemd-logging can't do better recovery than
>> underlying file system then doing so by systemd-logging is utterly
>> stupid, so if you, Mr Poettering, stop doing more userspace crap then
>> whole "Linux" will only benefit from this.
>>
>>
>> And the Red Hat should fire you out.
>> I reckon that fools are the worst plague in the World and that's why I
>> stopped tolerating fools.
>> I am a racist - I hate fools.
> 
> Please keep the discussion civil.  This sort of language is not welcome.

Thanks, Neil. Agreed.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
