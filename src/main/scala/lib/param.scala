package lib
import chisel3._
import chisel3.util._
trait param {
val BHT_ADDR_HI            = 0x09
  val BHT_ADDR_LO            = 0x02
  val BHT_ARRAY_DEPTH        = 0x0100
  val BHT_GHR_HASH_1         = 0x00
  val BHT_GHR_SIZE           = 0x08
  val BHT_SIZE               = 0x0200
  val BITMANIP_ZBA           = 0x00
  val BITMANIP_ZBB           = 0x01
  val BITMANIP_ZBC           = 0x00
  val BITMANIP_ZBE           = 0x00
  val BITMANIP_ZBF           = 0x00
  val BITMANIP_ZBP           = 0x00
  val BITMANIP_ZBR           = 0x00
  val BITMANIP_ZBS           = 0x01
  val BTB_ADDR_HI            = 0x009
  val BTB_ADDR_LO            = 0x02
  val BTB_ARRAY_DEPTH        = 0x0100
  val BTB_BTAG_FOLD          = 0x00
  val BTB_BTAG_SIZE          = 0x005
  val BTB_ENABLE             = 0x01
  val BTB_FOLD2_INDEX_HASH   = 0x00
  val BTB_FULLYA             = 0x00
  val BTB_INDEX1_HI          = 0x009
  val BTB_INDEX1_LO          = 0x002
  val BTB_INDEX2_HI          = 0x011
  val BTB_INDEX2_LO          = 0x00A
  val BTB_INDEX3_HI          = 0x019
  val BTB_INDEX3_LO          = 0x012
  val BTB_SIZE               = 0x0200
  val BTB_TOFFSET_SIZE       = 0x00C
  val BUILD_AHB_LITE         = 0x0
  val BUILD_AXI4             = 0x01
  val BUILD_AXI_NATIVE       = 0x01
  val BUS_PRTY_DEFAULT       = 0x03
  val DATA_ACCESS_ADDR0      = 0x000000000
  val DATA_ACCESS_ADDR1      = 0x000000000
  val DATA_ACCESS_ADDR2      = 0x000000000
  val DATA_ACCESS_ADDR3      = 0x000000000
  val DATA_ACCESS_ADDR4      = 0x000000000
  val DATA_ACCESS_ADDR5      = 0x000000000
  val DATA_ACCESS_ADDR6      = 0x000000000
  val DATA_ACCESS_ADDR7      = 0x000000000
  val DATA_ACCESS_ENABLE0    = 0x00
  val DATA_ACCESS_ENABLE1    = 0x00
  val DATA_ACCESS_ENABLE2    = 0x00
  val DATA_ACCESS_ENABLE3    = 0x00
  val DATA_ACCESS_ENABLE4    = 0x00
  val DATA_ACCESS_ENABLE5    = 0x00
  val DATA_ACCESS_ENABLE6    = 0x00
  val DATA_ACCESS_ENABLE7    = 0x00
  val DATA_ACCESS_MASK0      = 0x0FFFFFFFF
  val DATA_ACCESS_MASK1      = 0x0FFFFFFFF
  val DATA_ACCESS_MASK2      = 0x0FFFFFFFF
  val DATA_ACCESS_MASK3      = 0x0FFFFFFFF
  val DATA_ACCESS_MASK4      = 0x0FFFFFFFF
  val DATA_ACCESS_MASK5      = 0x0FFFFFFFF
  val DATA_ACCESS_MASK6      = 0x0FFFFFFFF
  val DATA_ACCESS_MASK7      = 0x0FFFFFFFF
  val DCCM_BANK_BITS         = 0x02
  val DCCM_BITS              = 0x010
  val DCCM_BYTE_WIDTH        = 0x04
  val DCCM_DATA_WIDTH        = 0x020
  val DCCM_ECC_WIDTH         = 0x07
  val DCCM_ENABLE            = 0x01
  val DCCM_FDATA_WIDTH       = 0x027
  val DCCM_INDEX_BITS        = 0x0C
  val DCCM_NUM_BANKS         = 0x004
  val DCCM_REGION            = 0x0F
  val DCCM_SADR              = 0x0F0040000
  val DCCM_SIZE              = 0x0040
  val DCCM_WIDTH_BITS        = 0x02
  val DIV_BIT                = 0x04
  val DIV_NEW                = 0x01
  val DMA_BUF_DEPTH          = 0x05a
  val DMA_BUS_ID             = 0x001
  val DMA_BUS_PRTY           = 0x02
  val DMA_BUS_TAG            = 0x01
  val FAST_INTERRUPT_REDIRECT = 0x01
  val ICACHE_2BANKS          = 0x01
  val ICACHE_BANK_BITS       = 0x01
  val ICACHE_BANK_HI         = 0x03
  val ICACHE_BANK_LO         = 0x03
  val ICACHE_BANK_WIDTH      = 0x08
  val ICACHE_BANKS_WAY       = 0x02
  val ICACHE_BEAT_ADDR_HI    = 0x05
  val ICACHE_BEAT_BITS       = 0x03
  val ICACHE_BYPASS_ENABLE   = 0x01
  val ICACHE_DATA_DEPTH      = 0x00200
  val ICACHE_DATA_INDEX_LO   = 0x04
  val ICACHE_DATA_WIDTH      = 0x040
  val ICACHE_ECC             = 0x01
  val ICACHE_ENABLE          = 0x01
  val ICACHE_FDATA_WIDTH     = 0x047
  val ICACHE_INDEX_HI        = 0x00C
  val ICACHE_LN_SZ           = 0x040
  val ICACHE_NUM_BEATS       = 0x08
  val ICACHE_NUM_BYPASS      = 0x02
  val ICACHE_NUM_BYPASS_WIDTH = 0x02
  val ICACHE_NUM_WAYS        = 0x02
  val ICACHE_ONLY            = 0x00
  val ICACHE_SCND_LAST       = 0x06
  val ICACHE_SIZE            = 0x0010
  val ICACHE_STATUS_BITS     = 0x01
  val ICACHE_TAG_BYPASS_ENABLE = 0x01
  val ICACHE_TAG_DEPTH       = 0x00080
  val ICACHE_TAG_INDEX_LO    = 0x06
  val ICACHE_TAG_LO          = 0x00D
  val ICACHE_TAG_NUM_BYPASS  = 0x02
  val ICACHE_TAG_NUM_BYPASS_WIDTH = 0x02
  val ICACHE_WAYPACK         = 0x01
  val ICCM_BANK_BITS         = 0x02
  val ICCM_BANK_HI           = 0x003
  val ICCM_BANK_INDEX_LO     = 0x004
  val ICCM_BITS              = 0x010
  val ICCM_ENABLE            = 0x01
  val ICCM_ICACHE            = 0x01
  val ICCM_INDEX_BITS        = 0x0C
  val ICCM_NUM_BANKS         = 0x004
  val ICCM_ONLY              = 0x00
  val ICCM_REGION            = 0x0E
  val ICCM_SADR              = 0x0EE000000
  val ICCM_SIZE              = 0x0040
  val IFU_BUS_ID             = 0x01
  val IFU_BUS_PRTY           = 0x02
  val IFU_BUS_TAG            = 0x03
  val INST_ACCESS_ADDR0      = 0x000000000
  val INST_ACCESS_ADDR1      = 0x000000000
  val INST_ACCESS_ADDR2      = 0x000000000
  val INST_ACCESS_ADDR3      = 0x000000000
  val INST_ACCESS_ADDR4      = 0x000000000
  val INST_ACCESS_ADDR5      = 0x000000000
  val INST_ACCESS_ADDR6      = 0x000000000
  val INST_ACCESS_ADDR7      = 0x000000000
  val INST_ACCESS_ENABLE0    = 0x00
  val INST_ACCESS_ENABLE1    = 0x00
  val INST_ACCESS_ENABLE2    = 0x00
  val INST_ACCESS_ENABLE3    = 0x00
  val INST_ACCESS_ENABLE4    = 0x00
  val INST_ACCESS_ENABLE5    = 0x00
  val INST_ACCESS_ENABLE6    = 0x00
  val INST_ACCESS_ENABLE7    = 0x00
  val INST_ACCESS_MASK0      = 0x0FFFFFFFF
  val INST_ACCESS_MASK1      = 0x0FFFFFFFF
  val INST_ACCESS_MASK2      = 0x0FFFFFFFF
  val INST_ACCESS_MASK3      = 0x0FFFFFFFF
  val INST_ACCESS_MASK4      = 0x0FFFFFFFF
  val INST_ACCESS_MASK5      = 0x0FFFFFFFF
  val INST_ACCESS_MASK6      = 0x0FFFFFFFF
  val INST_ACCESS_MASK7      = 0x0FFFFFFFF
  val LOAD_TO_USE_PLUS1      = 0x00
  val LSU2DMA                = 0x00
  val LSU_BUS_ID             = 0x01
  val LSU_BUS_PRTY           = 0x02
  val LSU_BUS_TAG            = 0x03
  val LSU_NUM_NBLOAD         = 0x004
  val LSU_NUM_NBLOAD_WIDTH   = 0x02
  val LSU_SB_BITS            = 0x010
  val LSU_STBUF_DEPTH        = 0x04
  val NO_ICCM_NO_ICACHE      = 0x00
  val PIC_2CYCLE             = 0x00
  val PIC_BASE_ADDR          = 0x0F00C0000
  val PIC_BITS               = 0x00F
  val PIC_INT_WORDS          = 0x01
  val PIC_REGION             = 0x0F
  val PIC_SIZE               = 0x0020
  val PIC_TOTAL_INT          = 0x01F
  val PIC_TOTAL_INT_PLUS1    = 0x0020
  val RET_STACK_SIZE         = 0x08
  val SB_BUS_ID              = 0x01
  val SB_BUS_PRTY            = 0x02
  val SB_BUS_TAG             = 0x01
  val TIMER_LEGAL_EN         = 0x01
  val RV_FPGA_OPTIMIZE = 0x1


}
