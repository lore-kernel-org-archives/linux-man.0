Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E745353EE0
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 03:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=131.179.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727689; cv=none; b=MGIXGAqzDYl1xKuSAeEmgZfPGL1oUWgZ0N5OutRuq/0NGz/4BmHHKI8HdEpigqbztmyIp3K5g0SvRTt5nnjyMeSeH6YUrXWZ5cjO8bjEaNCi8JzlURijbVRhsEX+vTEi57zZN7mMqr6MfXnVq9Ae9giMKC8BpAJVVxNQ5FRnnHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727689; c=relaxed/simple;
	bh=lKha8LSJ1pRfHqBjbuyGx7kfHF5CukaGPXe7UjQO8po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSDvdLi0+whLGwlma+0DAd5BKUvOcNamjtegvleD07lkI4AeNky0iY0gWmfc0KvBu3Tg3Swsw1Q2TtrksOIkBIvbaMIB+nh+x9KByUViOdzo2zUYyiAz+SVoG6KFYlGt3X5qqSsqhzIzqQBPrc0XEdTTNOn0hHWIUbAtR6+Qv10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu; spf=pass smtp.mailfrom=cs.ucla.edu; dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b=XMyWSmr2; arc=none smtp.client-ip=131.179.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b="XMyWSmr2"
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 742633C008EEE;
	Sun,  2 Aug 2026 20:28:01 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10032) with ESMTP
 id VxIUYRBTSv8e; Sun,  2 Aug 2026 20:28:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 4A2B23C097AC3;
	Sun,  2 Aug 2026 20:28:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu 4A2B23C097AC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1785727681;
	bh=baU6QdcIsWfqsS1BKD19cpfKamwJ9d59i4Ddt/htcwA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=XMyWSmr2F2RV2pjJgHColB8TNqct/PeDMKsfHmQU+WpRQeqfN9DJDm0PDKESo2Z2+
	 tNWnxlzhv6keS+snEmTMvHp4qy9neE9oCm+8rXaKHQHDrVDja6CrXU4aDtn9kloR0F
	 Ms0tVkLNs3tM9qtyCo7sHGIdJO9XgBy4X4HJdEM0OzLDmqC1tzKQv6J6Za4aLsMpX0
	 AapKCo5I5tQNikk43CzV/T7ogKUYLV+cjsCbX82C3encQRwupv0S62xhShntsh1ZyQ
	 QYTZgtAiVk3PJHjb82VfnMjo75ljJf2HF946+Dto8oqHewpX9SU1ptVCU/wkED41zd
	 fITHlOy0WTrlQ==
X-Virus-Scanned: amavis at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id sdHjbaspy8QG; Sun,  2 Aug 2026 20:28:01 -0700 (PDT)
Received: from [100.115.92.201] (130.108.221.216.static.srtnet.com [216.221.108.130])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id BFD093C008EEE;
	Sun,  2 Aug 2026 20:28:00 -0700 (PDT)
Message-ID: <c4d1d3f9-0c47-45aa-afa4-66dff49c1188@cs.ucla.edu>
Date: Sun, 2 Aug 2026 22:28:00 -0500
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: on the irresponsibility of pursuing C language reform
To: Alejandro Colomar <alx@kernel.org>
Cc: Steve Summit <scs@eskimo.com>, bug-gnulib@gnu.org,
 libc-alpha@sourceware.org, linux-man@vger.kernel.org
References: <87zez5bz49.fsf@gentoo.org> <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan> <am5_uA4MSujYCS9X@devuan>
 <2026Aug02.0852.scs.0001@tanqueray.home> <am8_MfPmud43naU-@devuan>
 <2026Aug02.0945.scs.0002@tanqueray.home> <am9OEJxrIMFc15GZ@devuan>
 <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu> <am-eAGL6OWqP9Yah@devuan>
Content-Language: en-US
From: Paul Eggert <eggert@cs.ucla.edu>
In-Reply-To: <am-eAGL6OWqP9Yah@devuan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/26 15:31, Alejandro Colomar wrote:
> strncat(3) is for example useful for
> implementing strndupa(3), which is quite useful (just like strndup(3))
> if you use substrings or other fixed-width arrays.
> 
> 	#define strndupa(s, n)  strncat(strcpy(alloca(n + 1), ""), s, n)

That's a bad implementation of strndupa for several reasons. (Some 
reasons are: it evaluates n multiple times, it overallocates stack space 
when strnlen (s, n) < n, it obviously has undefined behavior when n == 
SIZE_MAX, and it less obviously has undefined behavior because it uses 
alloca as the argument of a function call.) Fixing its problems makes it 
obvious that strndupa should not be implemented via strncat; it's much 
saner to use memcpy. Which is why glibc does it that way.

This example is not only not a good argument *for* strncat: it is an 
argument *against* strncat. It's yet another example of how strncat 
almost invariably encourages bad code.

As for the glibc manual's wording in this area, I readily concede that 
the the wording should be toned down (calling programmers "lazy" is just 
counterproductive), but its technical aspects are pretty much on target. 
Although one might valiantly argue that strncat etc. are about 
substrings, that's not their original design, that's not what they're 
good at, and that's not what they're mostly used for. What they're 
designed for, and what they're good at, and what they're mostly used for 
is arbitrary truncation of strings and string-like data, something that 
goes against the GNU programming guidelines, and something that 
programmers should be warned against.

We've already wasted too much of our valuable time on this topic so I'll 
let you have the last word.
