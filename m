From: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Subject: Re: [patch] koi8-r.7: potential wrong link, and letter names
Date: Sun, 24 Oct 2010 09:43:58 -0400
Message-ID: <ia1d6v$1m2$1@dough.gmane.org>
References: <i9srb4$sk2$1@dough.gmane.org> <AANLkTi=t2G87OYioUg8reifMaPBiC=cYjE3uJSBNnAhs@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=t2G87OYioUg8reifMaPBiC=cYjE3uJSBNnAhs-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Le 24/10/2010 02:59, Michael Kerrisk a =E9crit :

>> Could you please check the git. I had some problem saving and applyi=
ng
>> this patch, so made the changes manually.

Sorry, I guess this was due to my GPG signature. please find attached
just two s/LETTE /LETTER / in order to correct two typos, everything
else seems fine, thanks.


diff --git a/man7/koi8-r.7 b/man7/koi8-r.7
index 8b7bf67..075dab7 100644
--- a/man7/koi8-r.7
+++ b/man7/koi8-r.7
@@ -128,7 +128,7 @@ _
 305    197     C5      <C5>    CYRILLIC SMALL LETTER IE
 306    198     C6      <C6>    CYRILLIC SMALL LETTER EF
 307    199     C7      <C7>    CYRILLIC SMALL LETTER GHE
-310    200     C8      <C8>    CYRILLIC SMALL LETTE HA
+310    200     C8      <C8>    CYRILLIC SMALL LETTER HA
 311    201     C9      <C9>    CYRILLIC SMALL LETTER I
 312    202     CA      <CA>    CYRILLIC SMALL LETTER SHORT I
 313    203     CB      <CB>    CYRILLIC SMALL LETTER KA
@@ -137,7 +137,7 @@ _
 316    206     CE      <CE>    CYRILLIC SMALL LETTER EN
 317    207     CF      <CF>    CYRILLIC SMALL LETTER O
 320    208     D0      <D0>    CYRILLIC SMALL LETTER PE
-321    209     D1      <D1>    CYRILLIC SMALL LETTE YA
+321    209     D1      <D1>    CYRILLIC SMALL LETTER YA
 322    210     D2      <D2>    CYRILLIC SMALL LETTER ER
 323    211     D3      <D3>    CYRILLIC SMALL LETTER ES
 324    212     D4      <D4>    CYRILLIC SMALL LETTER TE


Regards

David


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
