Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3BA38384
	for <linux-man@vger.kernel.org>; Sun,  2 Feb 2025 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738501651; cv=none; b=uB1PXn6EvUAyNzX+6bpe/jMgDGw/534KsmXnGg6wic6dsIZnOjisD1hCqjeLS2oQfFX8jpHPkeAsLAj9dPjn7KGZoXFzD547JOP97zAIwVB9HO/cXkzYlG4nhf6Yn/3PNeVkTDBgMl3OPDh5a75CoznIKS7JXkkz8fGfZCcHt6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738501651; c=relaxed/simple;
	bh=ruiHWgagGMZgCN6BB7/H8mzUI4LwpyByuIn8RayKPew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7yycl3040FcVVnN6by6tbUlM0nm+2CqSKsP2NGqmz6wY7MMtYddVj0cE8QX+t1ZQfoYDtrBhaAh7GUtjL7diVTYF4hP/jLxgq6A7xmszQkucoiczV5xktZju+fkM4MxPYCC6N7aucAkRwbeK+z1euSZZVj+Bc3jzUwih+Il5vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=drabczyk.org; spf=pass smtp.mailfrom=drabczyk.org; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=drabczyk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=drabczyk.org
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
	by cmsmtp with ESMTPS
	id dtTgtCzglXshweZhAtSFQ9; Sun, 02 Feb 2025 13:07:28 +0000
Received: from gator3278.hostgator.com ([198.57.247.242])
	by cmsmtp with ESMTPS
	id eZh9tsXokDsoJeZh9tHSCC; Sun, 02 Feb 2025 13:07:28 +0000
X-Authority-Analysis: v=2.4 cv=Leg66Cfi c=1 sm=1 tr=0 ts=679f6e10
 a=wI8P0wgu9qut9Qmby1c6ng==:117 a=x0OE6rfHJZ6H1OKZOK5cGQ==:17
 a=kj9zAlcOel0A:10 a=T2h4t0Lz3GQA:10 a=VGZVzwQjAAAA:8 a=PUY_Lm-X4ufTVCYV9tYA:9
 a=CjuIK1q_8ugA:10 a=7KbCETwRv5F4J-amU3zH:22 a=m_VEIBz21GJuPbWKIyfi:22
Received: from 89-77-246-87.dynamic.chello.pl ([89.77.246.87]:56342 helo=localhost)
	by gator3278.hostgator.com with esmtpa (Exim 4.96.2)
	(envelope-from <arkadiusz@drabczyk.org>)
	id 1teZh9-0046Wp-04;
	Sun, 02 Feb 2025 07:07:27 -0600
Date: Sun, 2 Feb 2025 14:06:43 +0100
From: Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/signal.7: Update definition of SIGCHLD
Message-ID: <Z59t4-g91hVntcGQ@comp..>
References: <20250202121112.9911-1-arkadiusz@drabczyk.org>
 <daw7t3a6apgrepg35pxrhfnirxqtkjtzutonvv6ry5lvc7sdfg@5lj7652rabim>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daw7t3a6apgrepg35pxrhfnirxqtkjtzutonvv6ry5lvc7sdfg@5lj7652rabim>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3278.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - drabczyk.org
X-BWhitelist: no
X-Source-IP: 89.77.246.87
X-Source-L: No
X-Exim-ID: 1teZh9-0046Wp-04
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 89-77-246-87.dynamic.chello.pl (localhost) [89.77.246.87]:56342
X-Source-Auth: arkadiusz@drabczyk.org
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: cmt1bXZicmg7cmt1bXZicmg7Z2F0b3IzMjc4Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIQn35Q+JdsiRFwE8ZFs3nBOlH+a8Wm/nDtAqBURdh5IeLCM7lkmyGBKIuZ9Z7Eq1S8B+e6kvu3yImy1BwDxy4BNwfyGPTwLgIF/bJDCnfoU7dmZJbDr
 UwCRqlt/bEchRLWhUdVvH5KpZtyg/V9JCpTQ1igzAtiq7iQABpkNgc48ubnSWB4g446scLxoLqiQmKWLk+ODQ7JHrpw5EDypq28=

On Sun, Feb 02, 2025 at 01:30:00PM +0100, Alejandro Colomar wrote:
> Please add a comma before the 'or' (Oxford comma).  Other than that, it
> LGTM.  Do you know if there are any other XSI extensions documented here
> and what we do with them?  It would be interesting to be consistent
> about that.

No, I don't. It would require a lot of manual work to go through all
of them but I agree that it's a job that needs to be done.

-- 
Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
