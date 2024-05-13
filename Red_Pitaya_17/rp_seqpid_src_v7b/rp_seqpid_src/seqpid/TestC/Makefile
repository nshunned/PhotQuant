CFLAGS  = -g -std=gnu99 -Wall -Werror
#CFLAGS += -I/opt/redpitaya/include
#LDFLAGS = -L/opt/redpitaya/lib
CFLAGS += -I/home/RP_ecosystem_build/RedPitaya/apiseq/include
LDFLAGS = -L/home/RP_ecosystem_build/RedPitaya/apiseq/lib
LDLIBS = -lm -lpthread -lrpseq
#CFLAGS += -I/home/RP_ecosystem_build/RedPitaya/api/include
#LDFLAGS = -L/home/RP_ecosystem_build/RedPitaya/api/lib
#LDLIBS = -lm -lpthread -lrp

SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=)

all: $(OBJS)

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	$(RM) *.o
	$(RM) $(OBJS)
