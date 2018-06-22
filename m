From: Paul Eggert <eggert@cs.ucla.edu>
Subject: [tz] "time zone" vs "timezone" in documentation
Date: Fri, 22 Jun 2018 09:18:36 -0700
Message-ID: <2892e775-1503-ac52-4401-785bef9b1284@cs.ucla.edu>
References: <20180619013049.4097-1-eggert@cs.ucla.edu>
 <9838498d-0dc2-b51f-08af-fb447196cce5@gmail.com>
 <26ec9696-f120-15e7-9d9f-9a66eefce9a0@cs.ucla.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <tz-bounces@iana.org>
In-Reply-To: <26ec9696-f120-15e7-9d9f-9a66eefce9a0@cs.ucla.edu>
Content-Language: en-US
List-Unsubscribe: <https://mm.icann.org/mailman/options/tz>,
 <mailto:tz-request@iana.org?subject=unsubscribe>
List-Archive: <http://mm.icann.org/pipermail/tz/>
List-Post: <mailto:tz@iana.org>
List-Help: <mailto:tz-request@iana.org?subject=help>
List-Subscribe: <https://mm.icann.org/mailman/listinfo/tz>,
 <mailto:tz-request@iana.org?subject=subscribe>
Errors-To: tz-bounces@iana.org
Sender: "tz" <tz-bounces@iana.org>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, Time Zone Mailing List <tz@iana.org>
List-Id: linux-man@vger.kernel.org

[I am cc'ing this to the tz mailing list (and changing the subject line) 
to give tz readers a heads-up about the terminology issue. The question 
here is: should tzdb man pages say "time zone" or "timezone"?

For context please see Michael Kerrisk's email 
<https://marc.info/?m=152964652828320>, which says:

> When I inherited the project, the pages used a mixture of "time zone" 
> and "timezone", with the former predominant. I nevertheless 
> standardized on the latter, and although I don't recall for sure, I 
> suspect it was because that is the spelling used in POSIX. (As an 
> aside, there's an argument that--because POSIX--tzdb might want to 
> consider switching spellings.) I'm not religious about the particular 
> choice (although I have naturally now got used to the particular 
> choice I made some years ago), but I did make that choice because I 
> want consistency within the project, and I'm reluctant to introduce 
> inconsistency.

and my response <https://marc.info/?m=152964676331902>, which says:

> I deferred to POSIX for "timestamp" versus "time stamp", but 
> "timezone" is a bridge too far for me. 

]


On second thought, perhaps I was too hasty. We could distinguish "time 
zone" in the usual English-language sense (a set of geographic locations 
that currently share the same standard time offset from UTC) from 
"timezone" in the POSIX sense (a history and predicted future of UTC 
offsets, abbreviations and isdst flags). If so, the tzdb documentation 
could be more careful about using "time zone" for the former and 
"timezone" for the latter, and this would make for fewer changes to the 
GNU/Linux man-pages for tzdb. I can look into this and propose an 
updated set of tzdb-related patches accordingly.

If I were designing the terminology from scratch, I wouldn't specify two 
nearly-identical phrases "time zone" and "timezone" to mean such 
different things. However, the phrases do have the advantage of existing 
practice (common English usage and POSIX, respectively).
