Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5563B1F2BAD
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 19:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=131.179.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785698917; cv=none; b=CizlOrUCat7mAMBmALmmT0ji7X/wm7SrCtsQKi3EU43Ex65MU7YngJOORYutuBtfQqmRGro1Q3550kRRJfuZ2WVX3KJVHbOGJ4WGQl09VApI7xosMZnHCt4lJP/p3bcqlLWwzq4rl/9rObyLQ3sbVd4MJTAW0Fzcte8jIGK8HBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785698917; c=relaxed/simple;
	bh=d5uwNcNGweKnH5UDgj20gqm1uaTDhDDPmPEudQrE3H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TnlUUE1F2l2rhfNzK8sxr0MDdHOX8SoIMcOndxmHHshhCSxy4HB4Cmibg1iFZl5mbYMFVBuWESnzEd19XtnV+0NljcZTaik+/y0ndqOmE7340UIaPnZT057X4d1JXNBQHOGqBVbmn/mk9bxb+NluAkhx9WB6ybgVUByj8pTGCyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu; spf=pass smtp.mailfrom=cs.ucla.edu; dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b=jLhid6qz; arc=none smtp.client-ip=131.179.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b="jLhid6qz"
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 9CB053C00E882;
	Sun,  2 Aug 2026 12:28:35 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10032) with ESMTP
 id Mo-3HiQQJncF; Sun,  2 Aug 2026 12:28:35 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 718C73C097AC1;
	Sun,  2 Aug 2026 12:28:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu 718C73C097AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1785698915;
	bh=RA/7PEisS8oWtFjy3RDbut0lW9ECTnfgriuTvpCpWIY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=jLhid6qzWZCsphlt6fYxe+0yqeo11TmFHm01Dhappk8TUUGV4M2KiCLs9YnuD00sF
	 laBd8s5p1LcuUai4SSDQEi7VqPU97Uofc1B9mpNyZXAWoE0NzkpGtuzm2aRclx8CPp
	 VbtBN4XMxxbkQf1csyWtZYSjFIjrI7kB3Zqwi92bkKxdLwwHLPJllDE54ULSEifejZ
	 ho+2+Gxl4FjsqgLU0U+WSQXLVr7d5Lh7BYkmfgY0lMD/bd3SVbhqVGB/B+qNCSDvEN
	 Ck62nCvhTyn9TBFK3qZwPHZGqWp7qfJVAw9E0uUp15vfr4mCOfT+r9fdHdyBFPuOly
	 chNFqKa2EPmUw==
X-Virus-Scanned: amavis at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 9QahRUa79xss; Sun,  2 Aug 2026 12:28:35 -0700 (PDT)
Received: from [100.115.92.201] (130.108.221.216.static.srtnet.com [216.221.108.130])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id CFB303C00E882;
	Sun,  2 Aug 2026 12:28:34 -0700 (PDT)
Message-ID: <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>
Date: Sun, 2 Aug 2026 14:28:33 -0500
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: on the irresponsibility of pursuing C language reform
To: Alejandro Colomar <alx@kernel.org>, Steve Summit <scs@eskimo.com>
Cc: bug-gnulib@gnu.org, libc-alpha@sourceware.org, linux-man@vger.kernel.org
References: <87y0epdhxp.fsf@gentoo.org> <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org> <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan> <am5_uA4MSujYCS9X@devuan>
 <2026Aug02.0852.scs.0001@tanqueray.home> <am8_MfPmud43naU-@devuan>
 <2026Aug02.0945.scs.0002@tanqueray.home> <am9OEJxrIMFc15GZ@devuan>
Content-Language: en-US
From: Paul Eggert <eggert@cs.ucla.edu>
In-Reply-To: <am9OEJxrIMFc15GZ@devuan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/26 09:11, Alejandro Colomar wrote:
> I do use it in new code still today in shadow-utils.  I've heard tar(1)
> also needs that, and a few other places.

GNU tar proper has not used strncpy since 2018. It generally uses memcpy 
in the places it formerly used strncpy. Tar's 2018 change worked because 
the destinations were already zeroed out, so strncpy's zero-fill 
semantics were unnecessary and indeed a bit slower.

As for strncat, its API is a recipe for confusion and almost nobody 
remembers how it works. It is a poor design, plain and simple. Although 
strncpy may have a use or two for obsolete non-string data structures 
that violate GNU coding guidelines that have been in place since the 
1980s, strncat has no such redeeming virtues. The current man page for 
strncat does readers a misservice by not saying so clearly. In contrast, 
the glibc manual has reasonably decent warnings to users about how bad 
strncat is (strncpy/strlcpy/etc. too).

To improve the man pages it should be waayyy higher priority to fix 
their poor discussion of these truncation functions than to worry about 
whether the man page mentions <string.h> or some other header.
