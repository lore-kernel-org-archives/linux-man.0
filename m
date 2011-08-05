From: "Richard B. Kreckel" <kreckel-HEL5OUoDxoc@public.gmane.org>
Subject: Re: Wrong formulae for complex elementary functions
Date: Fri, 05 Aug 2011 23:34:54 +0200
Message-ID: <4E3C61FE.1010107@ginac.de>
References: <4CEF7677.30500@ginac.de> <AANLkTinAUyVTdjxY9KVgnOerWxhXtnvmHeTQ-Gb0-TxC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinAUyVTdjxY9KVgnOerWxhXtnvmHeTQ-Gb0-TxC-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Enge <andreas.enge-MZpvjPyXg2s@public.gmane.org>, Bill Allombert <Bill.Allombert-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>, Karim Belabas <Karim.Belabas-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi everybody,

On 11/27/2010 08:37 AM, Michael Kerrisk wrote:
> Hi Andries,
>
> Since you are the mathematician, can you comment?
>
> Thanks,
>
> Michael
>
> On Fri, Nov 26, 2010 at 9:57 AM, Richard B. Kreckel<kreckel-HEL5OUoDxoc@public.gmane.org>  wrote:
>> Hi!
>>
>> The man pages for cacos, cacosf, cacosl, catan, catanf, catanl, cacosh,
>> cacoshf, cacoshl, catanh, catanhf, and catanhl contain wrong maths.
>>
>> cacos, cacosf, cacosl:
>>   The formula given in the man page
>>     cacos(z) = -i clog(z + csqrt(z * z - 1))
>>   gives wrong results in second and fourth quadrant of complex plain.
>>   The formula
>>     cacos(z) = -i clog(z + I*csqrt(1 - z * z))
>>   gives correct results.
>>
>> catan, catanf, catanl:
>>   The formula given in the man page
>>     catan(z) = 1 / 2i clog((1 + iz) / (1 - iz))
>>   gives wrong results on the negative imaginary axis beginning at -I
>>   (along one of the two branch cuts). Besides, the formula is written
>>   in an ambiguous way.
>>   The formula
>>     catan(z) = (clog(1 + iz) - clog(1 - iz)) / 2i
>>   gives correct results.
>>
>> cacosh, cacoshf, cacoshl:
>>   The formula given in the man page
>>     cacosh(z) = (0.5) * clog((1 + z) / (1 - z))
>>   gives wrong results everywhere in the complex plain. (The formula
>>   seems to be copied from the one for catanh, where it is sometimes
>>   correct.)
>>   The formula
>>     cacosh(z) = 2 * clog(csqrt((z + 1)/2) + csqrt((z - 1)/2))
>>   gives correct results.
>>
>> catanh, catanhf, catanhl:
>>   The formula given in the man page
>>     catanh(z) = 0.5 * clog((1 + z) / (1 - z))
>>   gives wrong results on the positive real axis beginning at 1 (along
>>   one of the two branch cuts).
>>   The formula
>>     catanh(z) = 0.5 * (clog(1 + z) - clog(1 - z))
>>   gives correct results.
>>
>> I've also checked casin, casinf, casinl, casinh, casinhf, and casinhl and
>> the formulae given there
>>     casin(z) = -i clog(iz + csqrt(1 - z * z))
>>     casinh(z) = clog(z + csqrt(z * z + 1))
>> are actually correct.
>>
>> I suspect that some of these errors are due to somebody trying to "simplify"
>> these formulae. Since this can ruin the behavior, I recommend to add a
>> comment to the upstream sources that warns against attempt of
>> simplification.
>>
>> For the sake of reference, I am looking at manpages-dev 3.25-1 on
>> Debian/squeeze.
>>
>> Bye!
>>   -richy.
>> --
>> Richard B. Kreckel
>> <http://www.ginac.de/~kreckel/>

This doesn't have seem to have been fixed in the Linux man pages, does it?

May I suggest a non-mathematical approach to moving forward?

Just write a little C program and compare the complex results of
a) the library implementation of catan, cacos, etc.,
b) the formula written in the man page, and
c) the formula I proposed above.
If you include a couple of values from all four quadrants, you'll see 
that my formula always agrees with the implementation while the one from 
the man page doesn't.

Is there anything else I can do to convince you that this should be 
fixed? If yes, pretty please, let me know! I would really appreciate 
getting this fixed.

Best wishes
   -richy.
-- 
Richard B. Kreckel
<http://www.ginac.de/~kreckel/>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
