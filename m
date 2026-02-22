Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FB110785
	for <linux-man@vger.kernel.org>; Sun, 22 Feb 2026 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771769771; cv=pass; b=JDsOKYshYIYW6XoBRdevTxky5V+0KsoDaKiENu+LY+TzH9VDFJFHzzaS86MekKzMagde+kmCslYaIad600IrWdrAhLqzb+STTvfw6ryuNnXuej+NGMAWm2ujbfGVWF88nnSbavW8nh1Y2y+JZ9H3GVKJ65lu7tw6yq8weTiqHR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771769771; c=relaxed/simple;
	bh=/UOHWCVNMEMFLZAsidWGGrtTLDtMT5c5nd+uMBWbCsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a12mqFSZqdJbXIdLGpvboVAPcgVkCyHL7qQ3VvV1396KOnH5B9nQriS+l+MQLfi61/vzU7O1t8PE8dmmWK00SGPnknB+FckXGGuUxnhVtMgXG5+YVmd20Rj75z8qK21U8yRPgEv+VZuQMkQdrSpEPtA5EwwohQ2P3wPkd7NBCK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org; spf=pass smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=gl9KqHfz; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=9vfajSRm; arc=pass smtp.client-ip=85.215.255.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clisp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="gl9KqHfz";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="9vfajSRm"
ARC-Seal: i=1; a=rsa-sha256; t=1771769403; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LQvNf31I1dyg3Yf5ZxGnyYeiXOiNwFYim02dQ2P+G9xC/qzFRqFrLmiE8BMT7b04tl
    iPfhfX796WCeo/0PT6dU2PylyS7y2Nm+w2PjT8AXhGWbM4Y8X97hFcDOEUsakAz3C7LI
    omyRaWpbRCQIk68GPMlInV8S3AVea6JQS+/lTdBA4u4g6k7eKUP68RQUsh/WtwVzAFHo
    uGo8uufXIHeXuwPzIHxB2bNS/h5wdM6cMn2x9yhOhOXAHfIpMxGPXlkz25Emp65IfNg+
    8U1I4r4bdHofMz1O16zebZ40/oRgppwuXgdueJioFETr2SaG9gOMGGxy5B01nqNwwB56
    j3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771769403;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Q7hIY5pEeGccFqRqyHdxUscJphTLg0aki1ojhOFaC9M=;
    b=SVrX4Y7FkL3nFrVtU7MPZvMUCBj91g48qZ3X24bUOFzZdUDLF4p71p8CFuxDoalOGR
    AhBttiTpDZb0DykAIbsdJac0Jy8riMLYKv0WmexJnAra9f157v3XtVVFT7oerumNhifo
    agYKtVeC7t8oBaKpeIwNMKrWyLTyuamye5S7NiHXtUPoll2FZRRUnsuoUj/v9dg3jiC1
    IT5MN3kQFWCB8JFpO17HLr6JHRNDaWQ+7XLQOtTTtYnK+IUwqfYMIPcp0hDQUK2kadws
    XEZZ7DGZKtwKiEHmM8VWiH5nR/E5Oxw/khj7BaOqXVnNPmo2aCIKvGvs6QX1+ht6Mjdh
    YErg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771769403;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Q7hIY5pEeGccFqRqyHdxUscJphTLg0aki1ojhOFaC9M=;
    b=gl9KqHfzEI4O4y4ZiL4xp1VTGb016Iefa8vhAyzWxhbLvoeNlRD6pWfDuoJU8IZrcm
    t7wFpjrRbB2Rj+OQdzCCI75rWqJz4Utgxejy4AYZU/nlpYsKY1Yg8rP6PjyFj0su1/pf
    77bToo2NdFT9gpNnub1oxl+n+ECsUE7Tyigth6D4GHy4ouAOJG1eCxntbk1U7hnjoQsy
    RVQSBREc7NKCxAvVgTcjOlajqwoX8t52NVOCGZh/EsfZKYBCRAxCxZpcb5pe8OuazDd3
    c1nSNSZ72W1BjoPROt/fVQLXJIpQae8/Ag7Wki4N2aTGX03P2zX4sUAq3OsRAI4gYrAZ
    UUZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771769403;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Q7hIY5pEeGccFqRqyHdxUscJphTLg0aki1ojhOFaC9M=;
    b=9vfajSRm1b+5Tr6f6uQra5nU3VTHi0mCOKQ4fDqTQF0QU18FyCZHPvZIbNFiNkbisG
    /nmi7Mlj1hfpDzcSKvDg==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlLnY4jECd2hdUABIYZgv6aLDTL6XsuhNxYZcr35yqVMtF87yDfmvL3KrSSVxcfq6S"
Received: from nimes.localnet
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id Nd34d621MEA35ju
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 22 Feb 2026 15:10:03 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Paul Eggert <eggert@cs.ucla.edu>, bug-gnulib@gnu.org,
 linux-man@vger.kernel.org
Subject: Re: [PATCH v1 1/1] man/man3/strnul.3: New page
Date: Sun, 22 Feb 2026 15:10:03 +0100
Message-ID: <2947259.IIHS8v3jeM@nimes>
Organization: GNU
In-Reply-To: <aZsIJhUxHa1L1cme@devuan>
References:
 <cover.1771686088.git.alx@kernel.org> <aZrmh5XLcUcKJz4b@devuan>
 <aZsIJhUxHa1L1cme@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Alejandro Colomar wrote:
> 	 .B #include <string.h>
> 	 .P
> 	-.BI char\~*strnul(const\~char\~* s );
> 	+.BI QChar\~*strnul(QChar\~* s );
> 	 .fi

Ouch. This is not understandable. Why should a user learn about what 'QChar'
is??

It's basically like a C++ template with 2 instantiations. Just list them
explicitly; this will be much clearer.

It's common that the SYNOPSIS section has several lines. For example,
man1/locale.1 has 4 separate lines.

Bruno



