Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C1C391838
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 23:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=131.179.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785627478; cv=none; b=TFt5SbHz1BdmMyVQekS0/0twzAf54mn+g2De25Hl6ISUUu2OAptVPTnDNjDbLS5qWsm0MVgwyK9PxXOEQ97jB7/hcP/nQtOUxl7PPZpE3izhNzKotV6xatQzpOH0iOTCInMbtP1gxCvMSfOC5MTPvX5N+Z+mK4IIVjcgXSNC5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785627478; c=relaxed/simple;
	bh=0clUE33rjH/HZ4W1eS/rChPJkXkuZ4b6UNa05mMJqbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3l5jDZ0lOVDKy8IeLpOsNlpmxux7jGJ3wz+h8oOiy7GJqFgsdTnG+lqN9BdNiyyHXphqGtdMUT3hAumxN+fxPDMLTLadf7v8B17D2FLerXYerdMd+3fyHf7eJ/jwOJZIe0/WQrbvhDAkQoLF983OaxE9AxXp7wnBnX8MghZYz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu; spf=pass smtp.mailfrom=cs.ucla.edu; dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b=RE9Q47SI; arc=none smtp.client-ip=131.179.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b="RE9Q47SI"
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id F39213C097AC2;
	Sat,  1 Aug 2026 16:29:14 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10032) with ESMTP
 id LpE9GshkD5ck; Sat,  1 Aug 2026 16:29:14 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id C75093C097AC1;
	Sat,  1 Aug 2026 16:29:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu C75093C097AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1785626954;
	bh=too1YEq6EICXQpZLMCEkRC+7jxsk7S2dC87o9hG6Xi8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=RE9Q47SIeT0/JbFPyFdNrF3DY9C2/sbVoB/p1pQx1n6AaxWp+s542S4VXfUrxFJHh
	 pZdQNOzYBgo2BHesPmAmDPEhVmNIYOTwCkns75hacqZlyGF0MBfWdGNgrTXWiLSXtN
	 m6bVsjsJ+YKw29T2t3v6wnpwpy3KBLk+PURfaPktyHt1hgTk2EOsIZ2r5en+Aj8VXe
	 CPm0N1x8HllKh5Y8T2BGP+sz/sP59ZgYjAgPh4l9JJdVn5hzDgCF7qnITCT+oYQMK2
	 HE3SjyjPXVUI2c9NYjXIuOnfSLWu1ezEffSA1LcQCXxxObbWH2wBe5JGU5bLOEuM5k
	 WRlfNl2qgTfwg==
X-Virus-Scanned: amavis at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id yyFUrGP2NVeh; Sat,  1 Aug 2026 16:29:14 -0700 (PDT)
Received: from [100.115.92.201] (130.108.221.216.static.srtnet.com [216.221.108.130])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id 58C743C03E9FF;
	Sat,  1 Aug 2026 16:29:14 -0700 (PDT)
Message-ID: <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
Date: Sat, 1 Aug 2026 18:29:13 -0500
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard
 mem*() functions as provided by <memory.h>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, bug-gnulib@gnu.org, libc-alpha@sourceware.org
References: <cover.1785532392.git.alx@kernel.org> <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan> <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
Content-Language: en-US
From: Paul Eggert <eggert@cs.ucla.edu>
In-Reply-To: <am56ZBzNM5J07AUa@devuan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/26 17:10, Alejandro Colomar wrote:
> #include's aren't that important.

But this whole thread is about #includes, no?

I would focus energy on areas of the manual where effort provides the 
most bang for the buck. As your remark suggests, this particular area is 
low priority. Also, given what I've seen in the thread so far, the 
proposed change could even yield a negative return overall.
