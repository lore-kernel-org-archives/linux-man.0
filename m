Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FA33A7F4C
	for <linux-man@vger.kernel.org>; Tue, 24 Feb 2026 17:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=131.179.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771953251; cv=none; b=dXo0GNdChNTkR5DggX4M13OnWsyLZFvFa4GybmsvTqaS4an06lzPLVIyuZRMxLrQH80qFmzTTMXkgfv3a/oXTnmwd/HXE2sLKzfLVMUe9VRF2I3uVfw7zJAnCnIFRIrXGgxMkfwErNlRWvYdo/32S5WK9XiSdzYeGZLhuuwflWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771953251; c=relaxed/simple;
	bh=S1d5lr7kmnXBLQwYq395g4UUjV6RO/OMwALfVkEa0V4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EgqeLv43ppS7izDnRIY2PYSA3Lg0n/BoSyc0KuUOMLx68egpEGaaTCrsX5of0MUY/7aWiWZaF+6rb20j38UWWm9hSfYmaL3e7IJJQJU0IWoAJk1vY0NjHdJjT9kSaNKQopKzP1Z6Uk1e3DpipiuZ8/Id8Cj7jQji2AVdgUBYI20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu; spf=pass smtp.mailfrom=cs.ucla.edu; dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b=W18n/VHb; arc=none smtp.client-ip=131.179.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b="W18n/VHb"
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id E044D3C1082EF;
	Tue, 24 Feb 2026 09:14:04 -0800 (PST)
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10032) with ESMTP
 id Rn-L7S6ttgw0; Tue, 24 Feb 2026 09:14:04 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id B7C533C1082F2;
	Tue, 24 Feb 2026 09:14:04 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu B7C533C1082F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1771953244;
	bh=QJK7BY4xm57hUYngf2Yv1pIEpYcAIKbcf0KXufjia9g=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=W18n/VHbNCCX+orDvZAx5ANS+gTVdk08jFYN2g8ichLz1feBF6sIt4cQxueUnUBG2
	 0620yH2kQr2OXrPDSgk0rc41+cMelD2l8Nr8scGw+E8eBSm1pm9J4maZkz33Y6FJFx
	 UbNo6XkljWZPD2HeSpiacgJXI9OI2PW2J2zx3EZ5TuWdMx8BYjDjTMhtPjNF9K8y4x
	 XpTw1ExhmC/jFvXK5a6sB6TX5pvlFb0PmbewUF3WtbgCeSdn29/976LjWJ16u5c53e
	 Jx2oFNW92QZw97pJvoHkC3dZAzhrQ/c3bfS9dr79Xcg20d2ZXUWEsjjvJN+jvlDJOZ
	 EVPu/Feaoe8ug==
X-Virus-Scanned: amavis at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id k_azyXa2AwSz; Tue, 24 Feb 2026 09:14:04 -0800 (PST)
Received: from penguin.cs.ucla.edu (47-154-25-30.fdr01.snmn.ca.ip.frontiernet.net [47.154.25.30])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id 965E53C1082EF;
	Tue, 24 Feb 2026 09:14:04 -0800 (PST)
Message-ID: <67824728-313a-4f73-be2c-ad41697925b5@cs.ucla.edu>
Date: Tue, 24 Feb 2026 09:14:04 -0800
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QChar and QVoid for strchr(3), memchr(3), et al.
To: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
References: <aZ2xBQcy7mMEXW_b@devuan>
Content-Language: en-US
From: Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
In-Reply-To: <aZ2xBQcy7mMEXW_b@devuan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-02-24 06:28, Alejandro Colomar wrote:
> -  In the SYNOPSIS, do you prefer QChar/QVoid or overload style?
> 
> 	QChar *strchr(QChar *s, int c);
>     vs
> 	char *strnul(char *s);
> 	const char *strnul(const char *s);
One documents strchr, the other strnul. And strchr and strnul do differ: 
strchr has an underlying obsolescent function, and strnul does not. This 
suggests strchr should be documented differently from strnul.
