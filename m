Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12769434E58
	for <linux-man@vger.kernel.org>; Wed,  8 Jul 2026 11:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511890; cv=none; b=GbblAxlznIMSqoXaDqmhedOD/0pfFmHLgPfeSMaFbZDlWbEdxa9nl8xRT5LtZv8MDqk8Fo98X45qZp4zPy1HV6MCN1e12hTkc4SrkisL6MGNZHRWHJCv1SgwHfblFoafQ9Pv8ugaIhalDKrGarTj5D8WOufiYsa/zIdGkMEZEfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511890; c=relaxed/simple;
	bh=kl4ASXiiwjP8StFnWoAPq5n4/rAGByfOi2C7mOH11I4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fg4tlhZKJTlClgYO6wFBbR9RtGZ0phB/cYTh6OYepAgWCNKHSnoc2N+xphnWEQGrZKWV5IyhvxeVj8aZzfZPDSnGkmUTT++qP9PWUoT6tFvjP/V5XSaziJk3VQKOa6ObfWY9P7JkzlBicMB8jBYkBwjajxjn3LEPZXMihNK5d8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de; spf=pass smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 25121)
	id CE4961003C438A; Wed, 08 Jul 2026 13:58:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id CE1141100AF2E4;
	Wed, 08 Jul 2026 13:58:04 +0200 (CEST)
Date: Wed, 8 Jul 2026 13:58:04 +0200 (CEST)
From: Jan Engelhardt <ej@inai.de>
To: Alejandro Colomar <alx@kernel.org>
cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 2/2] console_codes.4: document more xterm codes
In-Reply-To: <ak4xQ66nid2RrSKe@devuan>
Message-ID: <p87sp316-232n-8303-q91n-o385066pr74r@vanv.qr>
References: <20260708104303.39708-1-jengelh@inai.de> <20260708104303.39708-2-jengelh@inai.de> <ak4xQ66nid2RrSKe@devuan>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wednesday 2026-07-08 13:17, Alejandro Colomar wrote:

>>  ESC ] 1 ; \f[I]txt\f[] ST	Set icon name to \f[I]txt\f[].
>>  ESC ] 2 ; \f[I]txt\f[] ST	Set window title to \f[I]txt\f[].
>> -ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set ANSI color \f[I]num\f[] to \f[I]txt\f[].
>> -ESC ] 10 ; \f[I]txt\f[] ST	Set dynamic text color to \f[I]txt\f[].
>> +ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set color \f[I]num\f[] (0-255) to \f[I]txt\f[].
>
>This seems to reword the description of ESC]4;num;txt, which doesn't
>seem to match the commit message.  Should this go into a separate
>commit?

I had inspected the xterm source code to figure out what codes are available
and what they really do. This naturally led to rewording inaccurate
descriptions in console_codes. I do not think it is necessary to split this
into much more commits. I could might have written

console_codes.4: document more xterm codes and fix some behavioral descriptions

but that gets a little long for a summary line, wdyt?


