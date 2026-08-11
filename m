Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CE744C4E2
	for <linux-man@vger.kernel.org>; Tue, 11 Aug 2026 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=131.179.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466880; cv=none; b=e+TDXrlLTDA3JJfUjfWKqgDtEfGKEOWA0LxTWCvuAaFngGmckXgEt2yZ3x5vqD6dYbcwxIzeJp6xtQm1oh9lGsertkenyV8jaUelhwuJ3Ev+1h20LbK2p8zGPUZ47XW2UR0m5/9fh/Eut9DGQOP76mnEWjGCNP8Aq6hyg2QN5FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466880; c=relaxed/simple;
	bh=yo+3ob6AwmCBd6RpGg8Qtwz7LT09aTkRjKNYDl6qWS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGgZXlFRCHZk341QSGBjiJSfkWBydku2xf0V7lDSBwTM0ih/fIq+8aqnQBws4TzehpwQoQ/uokwuiR6TU18JiOuHAUF0kDiFakEXEVbHwBdZ0vlPo7xPFf79SmXA7opXlQBOckKwnhfFSnXJym2F62FVoCx+47Rf5loFoTg1kTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu; spf=pass smtp.mailfrom=cs.ucla.edu; dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b=Ch021WkX; arc=none smtp.client-ip=131.179.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b="Ch021WkX"
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 6FF853C033C26;
	Tue, 11 Aug 2026 09:42:18 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10032) with ESMTP
 id qcyPjfihN-FV; Tue, 11 Aug 2026 09:42:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 38AED3C033C2B;
	Tue, 11 Aug 2026 09:42:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu 38AED3C033C2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1786466538;
	bh=JNeKrWvaJITLDl/IVxdZfa3dVvCjMYgy5liQubHArUA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Ch021WkXXFCVlBMPc/+zJooCqnG6Bubvk83PHUx5a2v85TIdyfszxyqahOUvFUsos
	 qXIiajN7uRL09WrbZQk2wBvwvE1dVUlGXd51CdcaqyOBqHxxLr8tjX6Tan9KiWucEQ
	 1KtkRwXgdUJcuuNwV3V8BbTMC1c+5o9dkjH5NY6PRemlZFKDrBN0vEi7i6cg0/vNwd
	 FmHPxxFoRuymQCxJW9grGLbR+fYjqzdqS2OSnzdNV1tG4U0eOSrfH3ECM5xTsUdU38
	 46x3tRb5lNj6Q6DqFhx72VsjIjU7KTaEOIIlwb6DEtezvRdZSC1aBzjC2wfohyGTcU
	 /IZxgWcRjPT4g==
X-Virus-Scanned: amavis at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 7mz2F57AYL0D; Tue, 11 Aug 2026 09:42:18 -0700 (PDT)
Received: from penguin.cs.ucla.edu (47-154-24-214.fdr01.snmn.ca.ip.frontiernet.net [47.154.24.214])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id E39913C033C26;
	Tue, 11 Aug 2026 09:42:17 -0700 (PDT)
Message-ID: <02892cc4-d247-4017-9f69-f22dcf566775@cs.ucla.edu>
Date: Tue, 11 Aug 2026 09:42:17 -0700
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: on project management
To: Robert Elz <kre@munnari.OZ.AU>
Cc: Ingo Schwarze <schwarze@usta.de>, =?UTF-8?Q?Arsen_Arsenovi=C4=87?=
 <arsen@aarsen.me>, enh@google.com,
 "G. Branden Robinson" <g.branden.robinson@gmail.com>,
 Alejandro Colomar <alx@kernel.org>, Collin Funk <collin.funk1@gmail.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-man@vger.kernel.org,
 bug-gnulib@gnu.org, libc-alpha@sourceware.org, groff@gnu.org,
 Valery Ushakov <uwe@stderr.spb.ru>
References: <ansK_CbsT9JFaOrS@snips.stderr.spb.ru>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid> <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan> <20260803160902.5edjmpxaqr5uudbu@illithid>
 <CAJgzZorzA1f+KNAj0m56nXxoKywY_pCj2pX3Rg-CgP1P8TnZuA@mail.gmail.com>
 <86a4r2oqqz.fsf@aarsen.me> <annM6oGYVgXByI5i@isnote.usta.de>
 <3881.1786452558@jacaranda.noi.kre.to>
Content-Language: en-US
From: Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
In-Reply-To: <3881.1786452558@jacaranda.noi.kre.to>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-11 05:49, Robert Elz wrote:
> I replied to Paul with more details, I saw the reply got to UCLA
> mail servers, but whether he received it, or it was treated as
> spam, I have no idea.
I got it. Thanks for the trip down memory lane. The amusing thing to me is how 7th Edition Unix got by without a single mem*-style function. When 7th Edition code wanted to (say) copy a block of memory it did so by hand, byte by byte.

Here are you sent me in your email dated Tue, 11 Aug 2026 03:56:27 +0700:
>     Date:        Mon, 10 Aug 2026 10:29:12 -0700
>     From:        Paul Eggert <eggert@cs.ucla.edu>
>     Message-ID:  <671ce30e-77ab-41db-afa3-28c53de65836@cs.ucla.edu>
> 
>   | In an email today[1], Ingo Schwarze mentioned your contribution to
>   | what became 4.3BSD,
> 
> There was some of that yes, starting around 3BSD, but:
> 
>   | a contribution that introduced <memory.h>.
> 
> I have no memory of anything related to that, and it sounds kind
> of unlikely  -- but that is all so long ago.   When I look in
> the sccs logs of memchr.c I see:
> 
> D 5.5   90/05/15 14:07:06 bostic        5 4     00022/00020/00011
> ANSI C version from Chris Torek
> 
> D 5.4   88/06/27 18:25:34 bostic        4 3     00010/00005/00021
> install approved copyright notice
> 
> D 5.3   88/05/25 14:23:52 bostic        3 2     00010/00008/00016
> written by Robert Elz; add Berkeley specific header
> 
> D 5.2   86/03/09 19:33:58 donn  2 1     00001/00001/00023
> added LIBC_SCCS condition for sccs ids
> 
> D 5.1   85/08/05 21:43:13 kre   1 0     00024/00000/00000
> date and time created 85/08/05 21:43:13 by kre
> 
> so I guess I probably did have something to do with some of it.
> 
> The comment at the top (after the copyright nonsense) says:
> 
> /*
>  * Sys5 compat routine
>  */
> 
> It included no header files.
> 
> But there was a <memory.h> created at about the same time:
> 
> D 5.4   90/05/15 19:43:57 bostic        4 3     00001/00001/00019
> string.h is ANSI C include file
> 
> D 5.3   90/02/12 12:20:39 bostic        3 2     00001/00005/00019
> might as well only have one copy.
> 
> D 5.2   88/08/12 14:13:46 bostic        2 1     00020/00013/00004
> correct list from manual page
> 
> D 5.1   85/08/05 21:21:49 kre   1 0     00017/00000/00000
> date and time created 85/08/05 21:21:49 by kre
> 
> The 5.3 change altered it to just be #include <strings.h> and then
> the 5.4 change made that <string.h>
> 
> (In both cases there were later revisions than shown here, but they're
> mostly just updates for 4.4 type stuff, different copyright/licence, etc,
> rather than anything substantive).
> 
>   | Ingo writes that the code's comment "appears to claim that <memory.h>
>   | along with these five functions [memccpy, memcmp, memcpy, memchr, memset]
>   | came from AT&T System V UNIX,
> 
> "came from" in the sense that SysV created those functions, and then
> CSRG (me it seems) made BSD implementations - they are all trivial.
> 
> 85 was probably the year I spent 3 months working at CSRG (I certainly
> remember there was such a 3 month period - I also remember never bothering
> to fill in a California Tax return, and recover the (about) $10 refund I
> would have had coming...   But I no longer actually remember which year that
> was.)
> 
>   | almost half a decade before ANSI C 89 standardized them to
>   | live in <string.h>."
> 
> Certainly could be - whether SysV used <memory.h> or whether that was an
> invention, I have no idea.
> 
> The comment at the head of that one just says:
> 
> /*
>  * Definitions of the Sys5 compat memory manipulation routines
>  */
> 
> No indication if SysV used the same file name or not.  If I had
> to guess, I'd suspect possibly so, as I doubt I would have called
> it "memory.h" had I been inventing its name - so that probably came
> from wherever the specs for the functions came from.
> ,,,
> I didn't check the other 4 functions, but if I wrote the initial version
> of memchr() for BSD, it seems likely I wrote the others as well, but the
> version distributed seems likely to have been Chris Torek's rewrite.
> My version had K&R C style function definitions.
